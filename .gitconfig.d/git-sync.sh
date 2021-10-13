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
   MAIN_BRANCH_NAME="$(git get-main-branch)"
   MAIN_REMOTE_NAME="$(git get-main-remote)"
#   git rev-parse --verify --quiet $MAIN_BRANCH_NAME || MAIN_BRANCH_NAME="main"
   ORIGINAL_MAIN_BRANCH_REF="$(git rev-parse $MAIN_BRANCH_NAME)"

   # sync any upstream first
   UPSTREAM="upstream"
#   [[ -n $(git branch --list $UPSTREAM) ]] && git ls-remote --heads $UPSTREAM &>/dev/null {
   MERGE_STATUS=0
   MERGE_TYPE=
   if git ls-remote --heads $UPSTREAM &>/dev/null; then
      git fetch --all

      if [[ "$GIT_BRANCH" =~ $MAIN_BRANCH_NAME ]]; then
         echo "$GITBIN merge $UPSTREAM/$MAIN_BRANCH_NAME"
         $GITBIN merge $UPSTREAM/$MAIN_BRANCH_NAME
      else
#         echo "$GITBIN checkout $MAIN_BRANCH_NAME"
#         $GITBIN checkout $MAIN_BRANCH_NAME

#         echo "$GITBIN merge $UPSTREAM/$MAIN_BRANCH_NAME"
#         if $GITBIN merge $UPSTREAM/$MAIN_BRANCH_NAME; then
         echo "$GITBIN fetch $UPSTREAM +$MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME"
         if $GITBIN fetch $UPSTREAM +$MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME; then
            echo "$GITBIN push $MAIN_REMOTE_NAME $MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME"
            $GITBIN push $MAIN_REMOTE_NAME $MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME

         else
            MERGE_TYPE=fetch
            MERGE_STATUS=1
         fi

#         echo "$GITBIN checkout -"
#         $GITBIN checkout -
      fi

      if [[ -z "$MERGE_TYPE" ]]; then
         # if the fetch/merge was successful, push the changes to the fork
         echo "$GITBIN push $MAIN_REMOTE_NAME $MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME"
         $GITBIN push $MAIN_REMOTE_NAME $MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME
      fi
   else
      if [[ "$GIT_BRANCH" =~ $MAIN_BRANCH_NAME ]]; then
         echo "$GITBIN pull"
         $GITBIN pull || {
            MERGE_TYPE=pull
            MERGE_STATUS=1
         }

      else
         echo "$GITBIN fetch $MAIN_REMOTE_NAME $MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME"
         $GITBIN fetch $MAIN_REMOTE_NAME $MAIN_BRANCH_NAME:$MAIN_BRANCH_NAME || {
            MERGE_TYPE=fetch
            MERGE_STATUS=1
         }

      fi
   fi

   if [[ -n "$MERGE_TYPE" ]]; then
      echo "GIT ${MERGE_TYPE} FAILED! ABORTING FURTHER CHANGES"
      continue
   fi

   if [[ ! "$GIT_BRANCH" =~ $MAIN_BRANCH_NAME ]]; then
      echo
      echo
      echo "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH_NAME'"
      $GITBIN rebase --autostash $MAIN_BRANCH_NAME || {
         [[ -f .git/rebase-merge/done ]] &&
            echo &&
            echo &&
            echo "ABORTING GIT REBASE '$GIT_BRANCH' ONTO '$MAIN_BRANCH_NAME'" &&
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
