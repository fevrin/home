#!/bin/bash

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
   cd $DIR

   # check if the directory is a git repo
   git rev-parse --is-inside-work-tree &>/dev/null || {
      echo "not a git directory: '$DIR'"
      echo "skipping!"
      continue
   }

   echo "WORKING ON '$DIR'"

   [[ $GIT_ADD_FILES -eq 1 ]] && {
      echo
      echo
      echo "STAGING FILES..."
      $GITBIN add -u
   }

   THERE_WERE_LOCAL_CHANGES="$($GITBIN status --untracked-files=no --porcelain)"
   STAGED_FILES="$(git diff --staged --name-only)"
   GIT_BRANCH="$(git branch --show-current)"

   echo
   echo
   echo "UPDATING MASTER..."
   ORIGINAL_MASTER_REF="$(git rev-parse master)"
   if [[ "$GIT_BRANCH" =~ master ]]; then
      $GITBIN pull
   else
      $GITBIN pull origin master:master 
   fi
   echo

   if [[ -n "$STAGED_FILES" ]]; then
      echo
      echo "THESE STAGED FILES WILL BE STASHED AND RE-STAGED:"
      echo "$STAGED_FILES"
   fi


   echo
   echo
   echo "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' ONTO MASTER"
   $GITBIN rebase --autostash master || {
      [[ -f .git/rebase-merge/done ]] &&
         echo &&
         echo &&
         echo "ABORTING GIT REBASE '$GIT_BRANCH' ONTO MASTER" &&
         $GITBIN rebase --abort
         date "+%F %H:%M:%S %Z: failure" | tee -a $HOME/$(basename "$DIR")-git-pull-timestamps
   }

   echo
   echo
   [[ -n "$STAGED_FILES" ]] && echo "RE-ADDING STAGED FILES" && git add --ignore-errors $STAGED_FILES
   echo

   date "+%F %H:%M:%S %Z: success" | tee -a $HOME/$(basename "$DIR")-git-pull-timestamps

   echo

#   cd - &>/dev/null
done
