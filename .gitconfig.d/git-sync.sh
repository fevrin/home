#!/bin/bash

# `git pull`s the main branch of the provided repos and rebases the current branch on that

export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh

declare -a DIRS

for arg in $@; do
   if [[ -d "$arg" ]]; then
      DIRS+=("$arg")
   elif [[ "$arg" =~ -a( |$) ]]; then
      GIT_ADD_FILES=1
   fi
done

[[ ${#DIRS[*]} -gt 0 ]] || DIRS+=("$PWD")

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
   cd $(git rev-parse --show-toplevel)

   # check if the directory is a git repo
   git rev-parse --is-inside-work-tree &>/dev/null || {
      echo "not a git directory: '$DIR'"
      echo "skipping!"
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
   GIT_BRANCH="$(git branch --show-current)"

   if [[ -n "$STAGED_FILES" ]]; then
      echo
      echo "THESE STAGED FILES WILL BE STASHED AND RE-STAGED:"
      echo "$STAGED_FILES"
   fi

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
      echo "GIT ${MERGE_TYPE} FAILED! ABORTING FURTHER CHANGES"
      continue
   fi

   if [[ ! "$GIT_BRANCH" =~ $MAIN_BRANCH ]]; then
      echo
      echo
      echo "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH'"
      $GITBIN rebase --autostash $MAIN_BRANCH || {
         [[ -f .git/rebase-merge/done ]] &&
            echo &&
            echo &&
            echo "ABORTING GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH'" &&
            $GITBIN rebase --abort
            date "+%F %H:%M:%S %Z: failure" | tee -a $HOME/$(basename "$DIR")-git-pull-timestamps
      }
   fi

   [[ -n "$STAGED_FILES" ]] && {
      echo
      echo
      echo "RE-ADDING STAGED FILES" && git add --ignore-errors $STAGED_FILES
      echo
   }

   echo

   date "+%F %H:%M:%S %Z: success" | tee -a $HOME/$(basename "$DIR")-git-pull-timestamps

#   cd - &>/dev/null
done
