#!/bin/bash

export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh

declare -a DIRS

for arg in $@; do
   if [[ -d "$arg" ]]; then
      DIRS+=("$arg")
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

   THERE_WERE_LOCAL_CHANGES="$($GITBIN status --untracked-files=no --porcelain)"
   GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

   echo "UPDATING MASTER..."
   ORIGINAL_MASTER_REF="$(git rev-parse master)"
   $GITBIN fetch origin master:master
   echo

   echo "ATTEMPTING TO GIT REBASE '$GIT_BRANCH' ONTO MASTER"
   $GITBIN rebase --autostash master || {
      [[ -f .git/rebase-merge/done ]] &&
         echo "ABORTING GIT REBASE '$GIT_BRANCH' ONTO MASTER" &&
         $GITBIN rebase --abort
         date "+%F %H:%M:%S %Z: failure" | tee -a $HOME/$(basename "$DIR")-git-pull-timestamps
   }
   echo

   date "+%F %H:%M:%S %Z: success" | tee -a $HOME/$(basename "$DIR")-git-pull-timestamps

   echo

#   cd - &>/dev/null
done
