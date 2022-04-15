#!/bin/bash

# `git pull`s the main branch of the provided repos and rebases the current branch on that

# possible resources:
# https://thoughtsimproved.wordpress.com/2015/08/17/self-updating-git-repos/
# https://gist.github.com/adilbaig/2e7ad4bf38cfc76afb4d

# TODO: add color support when INTERACTIVE = 1
# e.g., `git -c color.advice.hint=yellow rebase main`
# `git -c color.status=always status`
# you can get the custom color for a given item, if any, using something like:
# `git config --get-color color.advice`

export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh

# we have to source these since this is a script and not an environmental function
. $HOME/.bashrc.d/functions/verbose
. $HOME/.bashrc.d/functions/_print_var_vals
. $HOME/.bashrc.d/functions/_verify_reqs
#VERBOSE=8
INTERACTIVE=$(! tty -s; echo $?) # 1 if interactive; 0 if not
FETCH_REFRESH_TIME=300 # 300 seconds is the threshold before we, by default, skip fetching
FORCE_FETCH=0 # if set to 1, fetch regardless of SYNC_REFRESH_TIME
REBASE=1

declare -a DIRS

for arg in $@; do
   if [[ -d "$arg" ]]; then
      DIRS+=("$arg")
   elif [[ "$arg" =~ ^-a( |$) ]]; then
      GIT_ADD_FILES=1
   elif [[ "$arg" =~ ^--no-rebase( |$) ]]; then
      REBASE=0
   elif [[ "$arg" =~ ^--force-sync$ ]]; then
      FORCE_FETCH=1
   fi
done

[[ ${#DIRS[*]} -gt 0 ]] || DIRS+=("$PWD")

log() {
   local messages="$@"
   local IFS=$'\n'
   for message in $messages; do
   [[ "$INTERACTIVE" -eq 1 ]] && echo -e "$message" 2>&1
   date "+%F %H:%M:%S %Z: ($$) $(basename "$REPO_ROOT"): $(echo -e "$message" 2>&1)" >> $HOME/$(basename "$REPO_ROOT")-git-pull-timestamps
done

branch_is_current() {
   # inspired by <https://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git/3278427#3278427>
   local UPSTREAM=${1:-'@{u}'}
   local LOCAL=$(git rev-parse --abbrev-ref @)
   local LOCAL_HASH=$(git rev-parse "$LOCAL")
   local REMOTE=$(git rev-parse --abbrev-ref "$UPSTREAM")
   local REMOTE_HASH=$(git rev-parse "$REMOTE")
   local BASE_HASH=$(git merge-base "$LOCAL" "$REMOTE")

   _print_var_vals LOCAL LOCAL_HASH REMOTE REMOTE_HASH BASE_HASH
   if [[ $LOCAL_HASH = $REMOTE_HASH ]]; then
       log "$LOCAL and $REMOTE are: Up-to-date"
       return 0
   elif [[ $LOCAL_HASH = $BASE_HASH ]]; then
       log "Need to pull from $REMOTE"
       return 1
   elif [[ $REMOTE_HASH = $BASE_HASH ]]; then
       log "Need to push to $REMOTE"
       return 2
   else
       log "$LOCAL and $REMOTE: Diverged"
       return 3
   fi
}
}

#echo "DIRS = '"${DIRS[*]}"'"
#echo "STASH = '$STASH'"
#echo "DIRS LENGTH = '${#DIRS[*]}'"

#DIRS=(
##"$HOME"/home
##"$HOME"/repos/documentation
##"$HOME"/repos/chef
##"$HOME"/repos/cthulhu
##"$HOME"/repos/teams/service-catalog
#)

GITBIN="/usr/bin/git"

for DIR in ${DIRS[*]}; do
   cd "$DIR"
   REPO_ROOT="$(git rev-parse --show-toplevel)"
   cd "$REPO_ROOT"

   # check if the directory is a git repo
   $GITBIN rev-parse --is-inside-work-tree &>/dev/null || {
      log "not a git directory: '$DIR'"
      log "skipping!"
      continue
   }

#   log "INTERACTIVE = '$INTERACTIVE'"

   log "WORKING ON '$DIR'"

   echo
   MAIN_BRANCH="$(git get-main-branch)"
   MAIN_REMOTE="$(git get-main-remote)"
#   git rev-parse --verify --quiet $MAIN_BRANCH || MAIN_BRANCH="main"
   ORIGINAL_MAIN_BRANCH_REF="$(git rev-parse $MAIN_BRANCH)"

   # fetch any upstream first
   UPSTREAM="upstream"
#   [[ -n $(git branch --list $UPSTREAM) ]] && git ls-remote --heads $UPSTREAM &>/dev/null {
   MERGE_TYPE=
   FETCH_LAST_REFRESH="$(echo "($(date +%s) - $(stat -c %Y .git/FETCH_HEAD))" | bc)"

   if [[ "$FETCH_LAST_REFRESH" -ge "$FETCH_REFRESH_TIME" || "$FORCE_FETCH" -eq 1 ]]; then
      if [[ "$FETCH_LAST_REFRESH" -ge "$FETCH_REFRESH_TIME" ]]; then
         log "it's been more than 5 minutes since last fetch; fetching...";
      elif [[ "$FORCE_FETCH" -eq 1 ]]; then
         log "force fetching...";
      fi

      log "FETCHING REMOTES..."
      fetch_output=$($GITBIN fetch --all --prune 2>&1; exit $?)
      fetch_exit_code="$?"
      log "$fetch_output"
      [[ $fetch_exit_code -eq 0 ]] || {
         log "failure"
         continue
      }
   else
      log "skipping refresh since last refreshed $FETCH_LAST_REFRESH seconds ago"
   fi

   if [[ "$ORIGINAL_MAIN_BRANCH_REF" = "$(git rev-parse $MAIN_BRANCH)" ]]; then
      log "skipping further actions: no updates pulled"
      continue
   fi

      STAGED_FILES="$(git diff --staged --name-only)"
      UNSTAGED_FILES="$(git diff --name-only)"
      UNMERGED_FILES="$(git status --porcelain=v2 | sed -rne 's;^u.? .* ([^ ]+)$;\1;p')"
      GIT_BRANCH="$(git branch --show-current)"

      if [[ -n "$UNMERGED_FILES" ]]; then
         echo
         log "THERE ARE UNMERGED FILES; EXITING..."
         log "$UNMERGED_FILES"
         if [[ "$INTERACTIVE" -eq 1 ]]; then
            $GITBIN status
         else
            log "$($GITBIN status 2>&1)"
         fi
         exit 1
      fi

      for status in STAGED_FILES UNSTAGED_FILES; do
         if [[ -n "${!status}" ]]; then
            echo
            log "THESE ${status/_FILES/} FILES WILL BE STASHED AND RE-STAGED:"
            log "${!status}"
            echo
            STASH_NAME="git-sync.$$"
         fi
      done
      [[ -n "$STASH_NAME" ]] && $GITBIN stash push --message "$STASH_NAME"
      echo
      log "$(_print_var_vals -e STASH_NAME STAGED_FILES UNSTAGED_FILES UNMERGED_FILES 2>&1)"
   else
      log "skipping stashing"
   fi

   if git ls-remote --heads $UPSTREAM &>/dev/null; then
      # we're in a forked repo (assuming the upstream repo is aliased to $UPSTREAM)

      # if we're on the main branch, just merge the changes; otherwise fetch them
      # (which also merges with the '+' marker)
      if [[ "$GIT_BRANCH" =~ $MAIN_BRANCH ]]; then
         echo "$GITBIN merge $UPSTREAM $MAIN_BRANCH"
         $GITBIN merge $UPSTREAM $MAIN_BRANCH || {
            MERGE_TYPE="merge upstream"
         }
      else
#         echo "$GITBIN checkout $MAIN_BRANCH"
#         $GITBIN checkout $MAIN_BRANCH

#         echo "$GITBIN merge $UPSTREAM/$MAIN_BRANCH"
#         if $GITBIN merge $UPSTREAM/$MAIN_BRANCH; then
         echo "$GITBIN fetch $UPSTREAM +$MAIN_BRANCH:$MAIN_BRANCH"
         $GITBIN fetch $UPSTREAM +$MAIN_BRANCH:$MAIN_BRANCH || {
            MERGE_TYPE="fetch upstream"
         }

#         echo "$GITBIN checkout -"
#         $GITBIN checkout -
      fi

      if [[ -z "$MERGE_TYPE" ]]; then
         # if the fetch/merge was successful, push the changes to the fork
         echo "$GITBIN push $MAIN_REMOTE $MAIN_BRANCH:$MAIN_BRANCH"
         $GITBIN push $MAIN_REMOTE $MAIN_BRANCH:$MAIN_BRANCH
      fi
   else
      log "$(_print_var_vals -e GIT_BRANCH MAIN_BRANCH 2>&1)"
      if [[ "$GIT_BRANCH" =~ $MAIN_BRANCH ]]; then
         echo "$GITBIN merge"
         $GITBIN merge || {
            MERGE_TYPE=merge
         }

      else
         verbose 8 "$GITBIN fetch $MAIN_REMOTE $MAIN_BRANCH:$MAIN_BRANCH"
         echo "$GITBIN fetch $MAIN_REMOTE $MAIN_BRANCH:$MAIN_BRANCH"
         $GITBIN fetch $MAIN_REMOTE $MAIN_BRANCH:$MAIN_BRANCH || {
            MERGE_TYPE=fetch
         }

      fi
   fi

   if [[ -n "$MERGE_TYPE" ]]; then
      echo
      echo
      log "GIT ${MERGE_TYPE} FAILED! SKIPPING FURTHER CHANGES"
      continue
   fi

   if [[ "$REBASE" -eq 1 ]]; then
      # the main branch is already updated, so we just need to update the current branch if it's not the main one
      if [[ ! "$GIT_BRANCH" =~ $MAIN_BRANCH ]]; then
         echo
         echo
         log "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH'"
         rebase_result=$($GITBIN rebase $MAIN_BRANCH 2>&1; exit $?)
         rebase_exit_code="$?"
         #echo "rebase_result = '$rebase_result'"
         #echo "rebase_exit_code = '$rebase_exit_code'"
         log "$rebase_result"
         if [[ $rebase_exit_code -eq 0 ]]; then
            echo
            if [[ -n "$STASH_NAME" ]]; then
               log "POPPING STASHED FILES"
#               verbose 8 $GITBIN stash pop --index stash@{/"$STASH_NAME"}
               log "$GITBIN stash pop --index stash@{/\"$STASH_NAME\"}"
               if [[ "$INTERACTIVE" -eq 1 ]]; then
                  $GITBIN stash pop --index stash@{/"$STASH_NAME"}
               else
                  pop_result="$($GITBIN stash pop --index stash@{/"$STASH_NAME"})"
               fi
               POP_EXIT_CODE="$?"
               log "$pop_result"
               log "stash pop exit code: '$POP_EXIT_CODE'"
               [[ "$POP_EXIT_CODE" -ne 0 ]] && exit 1
            fi
         else
            if [[ -f .git/rebase-merge/done ]]; then
               echo
               echo
               echo -n "ABORT GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH'? [Y/n] "
               read
               if [[ ! "$REPLY" =~ ^n$ || $INTERACTIVE -eq 0 ]]; then
                  $GITBIN rebase --abort
                  log "failure: rebase aborted"
                  [[ -n "$STASH_NAME" ]] && log "stash saved as 'stash@{/"$STASH_NAME"}'"
               else
                  log 'failure: resolve any conflicts to fully rebase this branch, then retry `git-sync`'
               fi
            else
               log "failure: no rebase to abort"
            fi
            exit 1
         fi
      fi

      echo

      log "success"
   else
      log "skipping rebase: rebaes NOT requested"
   fi

#   cd - &>/dev/null
done
