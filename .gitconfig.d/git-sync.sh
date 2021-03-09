#!/bin/bash

export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh

declare -a DIRS
STASH="1"

for arg in $@; do
   if [[ -d "$arg" ]]; then
      DIRS+=("$arg")
   elif [[ "$arg" =~ ^(-n|--no-stash)$ ]]; then
      STASH="0"
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
   cd $DIR

   # check if the directory is a git repo
   git rev-parse --is-inside-work-tree &>/dev/null || {
      echo "not a git directory: '$DIR'"
      echo "skipping!"
      continue
   }

   echo "WORKING ON '$DIR'"
   echo
#   output=$(git status --untracked-files=no --porcelain)
#   if [[ "$output" ]]; then
#      $GITBIN stash push 
#   else

   THERE_WERE_LOCAL_CHANGES="$($GITBIN status --untracked-files=no --porcelain)"
   TEMP_ID="$(mktemp -u XXXXXXXXXX) @ $(date +%s)"
   GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

   if [[ $THERE_WERE_LOCAL_CHANGES && $STASH = 1 ]]; then
      echo "STASHING CURRENT INDEX AND UNSTAGED FILES IN BRANCH '$GIT_BRANCH'"

      # stashing doesn't retain files' index status, so we have to track that
      # nvm, `git stash pop --index` restores the index status
#      STAGED_FILES="$($GITBIN diff --cached --name-only)"

      STASH_MSG="git sync temp stash $TEMP_ID"
      $GITBIN stash push -m "$STASH_MSG"
      STASH_REF="$(git stash list | grep "$STASH_MSG" | cut -d: -f1)"
      echo
   fi

   echo "UPDATING MASTER..."
   [[ $GIT_BRANCH =~ ^master$ ]] || $GITBIN checkout master
   ORIGINAL_MASTER_REF="$(git rev-parse master)"
   $GITBIN pull --ff-only
   echo

   # if the original branch wasn't master, and updates were made to master,
   # rebase it from master
   if [[ ! $GIT_BRANCH =~ ^master$ ]]; then
      $GITBIN checkout -

#      if [[ $ORIGINAL_MASTER_REF = $(git rev-parse master) ]]; then
#         echo "MASTER UNCHANGED; SKIPPING REBASE OF '$GIT_BRANCH' FROM MASTER"
#      else
         echo "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' FROM MASTER"
         $GITBIN rebase master || {
            [[ -f .git/rebase-merge/done ]] &&
               echo "ABORTING GIT REBASE '$GIT_BRANCH' FROM MASTER" &&
               $GITBIN rebase --abort
         }
         echo
#      fi
   fi

   if [[ $THERE_WERE_LOCAL_CHANGES && $STASH = 1 ]]; then
      echo "POPPING GIT STASH"
      $GITBIN stash pop --index "$STASH_REF"

      # restore index status of the files
#      [[ $STAGED_FILES ]] && $GITBIN add $STAGED_FILES
   fi
#   fi

   date "+%F %H:%M:%S %Z" | tee -a $HOME/${DIR##*/}-git-pull-timestamps

   echo

#   cd - &>/dev/null
done
