#!/bin/bash

# `git pull`s the main branch of the provided repos and rebases the current branch on that

export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh

. $HOME/.bashrc.d/functions/verbose
. $HOME/.bashrc.d/functions/_print_var_vals
. $HOME/.bashrc.d/functions/_verify_reqs
VERBOSE=8
INTERACTIVE=$(! tty -s; echo $?) # 1 if interactive; 0 if not

declare -a DIRS

for arg in $@; do
   if [[ -d "$arg" ]]; then
      DIRS+=("$arg")
   elif [[ "$arg" =~ -a( |$) ]]; then
      GIT_ADD_FILES=1
   fi
done

[[ ${#DIRS[*]} -gt 0 ]] || DIRS+=("$PWD")

log() {
   local message="$@"
#   _print_var_vals DIR
   date "+%F %H:%M:%S %Z: ($$) $(basename "$REPO_ROOT"): $(verbose 8 $message 2>&1)" | tee -a $HOME/$(basename "$REPO_ROOT")-git-pull-timestamps
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
   log "INTERACTIVE = '$INTERACTIVE'"
   cd "$DIR"
   REPO_ROOT="$(git rev-parse --show-toplevel)"
   cd "$REPO_ROOT"

   # check if the directory is a git repo
   git rev-parse --is-inside-work-tree &>/dev/null || {
      log "not a git directory: '$DIR'"
      log "skipping!"
      continue
   }

   echo "WORKING ON '$DIR'"

   [[ $GIT_ADD_FILES -eq 1 && $(git diff --quiet --exit-code; echo $?) -eq 1 ]] && {
      echo
      echo
      echo "STAGING FILES..."
      $GITBIN add -u
   }

   THERE_WERE_LOCAL_CHANGES="$($GITBIN status --untracked-files=no --porcelain)"
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
      exit
   fi

   for status in STAGED_FILES UNSTAGED_FILES; do
      if [[ -n "${!status}" ]]; then
         echo
         echo "THESE ${status/_FILES/} FILES WILL BE STASHED AND RE-STAGED:"
         echo "${!status}"
         echo
         STASH_NAME="git-sync.$$"
      fi
   done
   [[ -n "$STASH_NAME" ]] && $GITBIN stash push --message "$STASH_NAME"

   echo
   echo
   echo "UPDATING MAIN BRANCH..."
   MAIN_BRANCH="$(git get-main-branch)"
   MAIN_REMOTE="$(git get-main-remote)"
#   git rev-parse --verify --quiet $MAIN_BRANCH || MAIN_BRANCH="main"
   ORIGINAL_MAIN_BRANCH_REF="$(git rev-parse $MAIN_BRANCH)"

   # sync any upstream first
   UPSTREAM="upstream"
#   [[ -n $(git branch --list $UPSTREAM) ]] && git ls-remote --heads $UPSTREAM &>/dev/null {
   MERGE_TYPE=
   git fetch --all --prune
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
      if [[ "$GIT_BRANCH" =~ $MAIN_BRANCH ]]; then
         echo "$GITBIN merge"
         $GITBIN merge || {
            MERGE_TYPE=merge
         }

      else
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

   # the main branch is already updated, so we just need to update the current branch if it's not the main one
   if [[ ! "$GIT_BRANCH" =~ $MAIN_BRANCH ]]; then
      echo
      echo
      echo "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH'"
      if [[ "$INTERACTIVE" -eq 1 ]]; then
         $GITBIN rebase $MAIN_BRANCH
         rebase_exit_code="$?"
      else
         rebase_result=$($GITBIN rebase $MAIN_BRANCH 2>&1; exit $?)
         rebase_exit_code="$?"
         log "$rebase_result"
      fi
      if [[ $rebase_exit_code -eq 0 ]]; then
         echo
         log $(_print_var_vals STASH_NAME STAGED_FILES UNSTAGED_FILES UNMERGED_FILES)
         echo
         if [[ -n "$STASH_NAME" ]]; then
            echo "POPPING STASHED FILES"
#            verbose 8 $GITBIN stash pop --index stash@{/"$STASH_NAME"}
            log "$GITBIN stash pop --index stash@{/\"$STASH_NAME\"}"
            $GITBIN stash pop --index stash@{/"$STASH_NAME"}
            POP_EXIT_CODE="$?"
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

#   cd - &>/dev/null
done
