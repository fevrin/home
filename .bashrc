#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

has() {
   command -v -- "${1}" &>/dev/null
}

export SHELL_TYPE="$(command -p \ps -ocomm= -p $$)"

# don't overwrite ~/.bash_history file upon logging out
shopt -s histappend

# Comment in the above and uncomment this below for a color prompt
if [[ $(id -u) -eq 0 ]]; then
   PS1='\n${debian_chroot:+($debian_chroot)}\033[00;00m\[\033[01;31m\]\u\[\033[01;33m\]@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;34m\]\!\[\033[00m\]\$ '
else
   if [[ -f /usr/lib/git-core/git-sh-prompt || -f /usr/local/git/contrib/completion/git-prompt.sh ]]; then
      export GIT_PS1_SHOWDIRTYSTATE=true
      export GIT_PS1_SHOWUNTRACKEDFILES=true
      export GIT_PS1_SHOWCOLORHINTS=true

      if has direnv && [[ -r .envrc ]]; then
         DIRENV_ALLOWED="$(direnv status | sed -rne "/^Found RC path ${PWD//\//\\/}\/\.envrc/,/Found RC allowed/s;Found RC allowed (.+)$;\1;p")"
         if [[ $(egrep -c '(^|[^#]+)\b(export|unset) GIT_PS1_SHOWUNTRACKEDFILES\b' .envrc) -lt 1 ]]; then
            # the variable isn't already explicitly set or unset
            if [[ $(du -s --block-size=1M $PWD 2>/dev/null | egrep -o '^[0-9]+') -lt 100 ]]; then
               # GIT_PS1_SHOWUNTRACKEDFILES adds some load time to each bash prompt when within large git repos
               # we'll export it only if we use `direnv` and the repo is less than 100MB
               # this is so we run `du` just once, when either setting or unsetting the variable,
               # then let `direnv` do its thing on all subsequent `cd`'s into the directory
               export GIT_PS1_SHOWUNTRACKEDFILES=true
               echo 'export GIT_PS1_SHOWUNTRACKEDFILES=true' >>.envrc
            else
               # repo is bigger than 100MB and doesn't already handle the `GIT_PS1_SHOWUNTRACKEDFILES` variable
               echo 'unset GIT_PS1_SHOWUNTRACKEDFILES' >>.envrc
            fi
            # run `direnv allow` if it was already allowed before the above change
            [[ $DIRENV_ALLOWED =~ ^true$ ]] && direnv allow
         fi
         unset DIRENV_ALLOWED
      fi

      # append history commands to ~/.bash_history as they are executed;
      #from <http://www.ukuug.org/events/linux2003/papers/bash_tips/>.  also, read in latest bash history
      # inspired by <https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history/18443#18443>
      # that recommends the following, which seems to just endlessly add duplicate commands to individual entries:
      # per the git-sh-prompt file notes, __git_ps1 automatically sets PS1 with the provided values
      # history -n;
      # history -w;
      # history -c;
      # history -r;

      hostname_color="yellow"
      [[ -n $SSH_CONNECTION ]] && hostname_color="red"

      PROMPT_COMMAND='
      __git_ps1 \
      "\n$(colorize bold green "$USER" bold '"${hostname_color}"' "@$HOSTNAME" none ":" bold blue "\w")" \
      "\n\D{%F %T %Z}\n\[\033[01;34m\]\!\[\033[00m\]\$ "
      '

      unset hostname_color

      read -r -d '' PROMPT_COMMAND <<-EOF
			history -n; # Read the history lines not already read from the history file into the current history list. These are lines appended to the history file since the beginning of the current bash session.
			history -w; # Write the current history list to the history file, overwriting the history file's contents.
			history -c; # Clear the history list by deleting all the entries.
			history -r; # Read the contents of the history file and append them to the current history list.
			$PROMPT_COMMAND
		EOF
      # originally:
      # history -a; # Append the 'new' history lines to the history file. These are history lines entered since the beginning of the current bash session, but not already appended to the history file.
      # history -c; # Clear the history list by deleting all the entries.
      # history -r; # Read the contents of the history file and append them to the current history list.
      # history -w; # Write the current history list to the history file, overwriting the history file's contents.
      # something about this causes odd cursor placement when reviewing
      #bash history, so we have to use the old-fashioned color escapes
      #"\n$(colorize bold blue "\!" none "\$") "

   #   # alternative version with some slightly different formatting and coloring
   #   # a major thing this has over the above is no graphical weirdness
   #   #when reviewing some commands in bash history
   #   export PS1='\
   #   \n${debian_chroot:+($debian_chroot)}\033[00;00m\[\033[01;32m\]\u\[\033[01;33m\]@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(\
   #   if [[ $(git branch &>/dev/null; echo $?) -eq 0 ]]; then \
   #     if [[ "$(git status | grep "nothing to commit" >/dev/null 2>&1; echo $?)" -eq "0" ]]; then \
   #       # Clean repository - nothing to commit
   #       colorize green "$(__git_ps1 " (%s)")"; \
   #     else \
   #       # Changes to working tree
   #       colorize red "$(__git_ps1 " {%s}")"; \
   #     fi \
   #   fi) \
   #   \n\[\033[01;34m\]\!\[\033[00m\]\$ '
   else
      export PROMPT_COMMAND='
      history -a;
      history -c;
      history -r;
      history -w;
      echo -en \
      "\n$(colorize bold green "$USER" bold yellow "@$HOSTNAME" none ":" bold blue "$PWD")" \
      '
      export PS1="\n\D{%F %T %Z}\n\[\033[01;34m\]\!\[\033[00m\]\$ "
   fi

fi

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#export CDPATH=~/documents:~/music:~/programs:~/pictures:~/movies:~/desktop:~/programs/program_documentation--Linux/miscellaneous

##########################################################
######## Bash Completions #####
###############################

# it seems the `git` package sets up only /etc/bash_completion.d/git-prompt (which sources /usr/lib/git-core/git-sh-prompt), but not an equivalent for git-completion.bash, which is needed for additional completions, like branch names
for completion_file in \
   /usr/lib/git-core/git-sh-prompt \
   /usr/local/git/contrib/completion/git-prompt.sh \
   /usr/local/git/contrib/completion/git-completion.bash \
   /usr/share/bash-completion/completions/git \
; do
   completion_link="/etc/bash_completion.d/${completion_file##*/}-completion"
   # the source completion file exists
   if [[ -f "${completion_file}" ]]; then
      # and it's either copied to, symlinked to, or sourced from a file in /etc/bash_completion
      [[ -f "${completion_link}" || -h "${completion_link}" ]] || {
         egrep -q "(\.|source) ${completion_file}" /etc/bash_completion.d/* || {
            # otherwise, symlink to it
            echo -n "symlink ${completion_file} ${completion_link}? [Y/n] "; read
            [[ $REPLY =~ ^n$ ]] || {
               sudo ln -s "${completion_file}" "${completion_link}" || {
                  # or source it directly if that doesn't work
                  . "${completion_file}"
               }
            }
         }
      }
   fi
done
unset completion_file
unset completion_link

[[ -x $HOME/go/bin/gocomplete ]] && complete -C $HOME/go/bin/gocomplete go

##########################################################
######## Source Files #########
###############################

declare -a files_to_source
declare -a dirs_for_path
declare -a dirs_for_gopath

# to add more files, just either add them here or in any sourced directories
# note that they are sourced in alphanumeric order, which you can use to source in a particular order, based on dependencies
files_to_source=(
   ~/.bashrc.d/*
   ~/bin/lib/lib_all
   /etc/bash_completion
)

# prep apple terminal, if we're using it
MAC_OS_X=0
if [[ "$TERM_PROGRAM" == "Apple_Terminal" || "$TERM_PROGRAM" =~ iTerm ]]; then
   MAC_OS_X=1
   files_to_source+=("$HOME/.macrc")
fi

for file in ${files_to_source[*]}; do
   # account for the special config file named "remote", which should
   # be sourced only on remote systems accessed via ssh
   [[ "$file" =~ remote ]] &&
    [[ -z "$SSH_CLIENT" || -z "$SSH_TTY" || -z "$SSH_CONNECTION" ]] &&
    continue

   [[ -d "$file" ]] && continue

   [[ -r "$file" ]] &&
   [[ ! "$file" =~ python ]] &&
   file -L --mime-type "$file" | egrep -q '(text/x-shellscript|bash_completion)' && # git-sh-prompt shows as 'text/plain'
   bash -n "$file" 2>/dev/null &&
#   echo "sourcing '$file'..." >&2 &&
#   TIMEFORMAT='%R' &&
#   time . "$file"
   . "$file"
done
unset files_to_source file

##########################################################

##########################################################
######## Source Dirs ##########
###############################

dirs_for_path+=(
   "${HOME}"/bin
)

# add a GOPATH value if go's installed
# and add it to the general PATH, as well
if has go; then
   dirs_for_gopath+=(
      "$HOME/go"
   )

   for dir in ${dirs_for_gopath[*]}; do
      # add optional directories to the user's PATH if they exist and are not already in their PATH
      if [[ -d "$dir" ]] && [[ ! $GOPATH =~ (:"$dir"|"^$dir$"|"$dir":) ]]; then
         if [[ -n "$GOPATH" ]]; then
            GOPATH+=":$dir"
         else
            GOPATH+="$dir"
         fi
      fi

      # add the last bin subdirectory that exists as the value of GOBIN
      if [[ -d "$dir/bin" && -z $GOBIN ]]; then
         dirs_for_path+=("$dir/bin")
         export GOBIN="$dir/bin"
      fi
   done
   unset dirs_for_gopath dir
fi

for dir in ${dirs_for_path[*]}; do
   # add optional directories to the user's PATH if they exist and are not already in their PATH
   if [[ -d "$dir" ]] && [[ ! $PATH =~ (:"$dir"|"^$dir$"|"$dir":) ]]; then
      if [[ -n "$PATH" ]]; then
         PATH+=":$dir"
      else
         PATH+="$dir"
      fi
   fi
done
unset dirs_for_path dir

# remove all trailing slashes from PATH
PATH="${PATH//\/:/:}"
PATH="${PATH//::/:}"
PATH="${PATH%%\/}"
PATH="${PATH##:}"
PATH="${PATH%%:}"
GOPATH="${GOPATH##:}"
GOPATH="${GOPATH%%:}"

##########################################################
######## History Control ######
###############################

# ensure ~/.bash_history is in append-only mode since there's craziness with it being inappropriately truncated
# the `ls -lO` part is a Mac OS X compatibility crutch
if [[ $MAC_OS_X -eq 0 ]]; then
   [[ $(has lsattr) && $(lsattr $HOME/.bash_history) =~ ^.....a.*$ ]] ||
      cat <<-EOF
		warning: $HOME/.bash_history is not in append-only mode!

		enable that with this command:

		   sudo chattr +a $HOME/.bash_history

		EOF
else
   [[ ! $(ls -lO "$HOME"/.bash_history) =~ uappnd ]] ||
      cat <<-EOF
		warning: $HOME/.bash_history is not in append-only mode!

		enable that with this command:

		   sudo chflags uappend $HOME/.bash_history

		EOF
fi

# inform the user if the ~/.bash_history file is greater than or equal to the $HISTFILESIZE value for rotation
[[ $(wc -l $HOME/.bash_history | cut -d' ' -f1) -ge $HISTFILESIZE ]] && echo "consider making a new $HOME/.bash_history file, as it's >= to $HISTFILESIZE lines"

# don't remember basic/common commands, including all bash aliases
# i really need to make a level 0/level 6 script using perl or something to have greater control over regexes; plus, it can be annoying to have the commands immediately removed; lastly, duplicates aren't always removed like they should be
HISTIGNORE="bg:cd *:crontab -?:df -h:echo:edit-history:fg*:git co master:jobs:kill*:ls:list -tr:ping 8.8.8.8:popd:pushd:pwd:screen -r:screen -t *:vim:vim nodes:w"

# add git aliases
HISTIGNORE+=":$(
   has git && {
      for i in $(git config -l | sed -rne 's;^alias\.([^=]+)=.*;\1;p'); do
         # git config --get-regexp alias | sed -rne 's;^alias\.([^ ]+) .*;\1;p'
         value+="git $i:";
      done;
      echo "${value%:}";
   }
)"
# add main aliases
HISTIGNORE+=":$(
   # list aliases to include in HISTIGNORE
   includes=(
   eh
   )
   includes="$(
   for i in ${!includes[*]}; do
      [[ $i -eq 0 ]] && echo -n "(${includes[$i]}" && continue
      echo -n "|${includes[$i]}"
   done
   echo -n ")"
   )"
   trailing_char="*" # ignore all aliases
   alias |
    # list aliases to exclude from HISTIGNORE
    grep -vf <(cat <<-EOF | xargs -I{} echo ^alias {}
		aptinstall
		aptsearch
		aptshow
		cp
		dir
		egrep
		grep
		list
		mtr
		mv
		nmap
		EOF
    ) |
    egrep -o "^alias (([^=]{3,})|$includes)=.*" |
    sed -re "s;^alias $includes=.*;:\1;" |
    sed -re "s;^alias ([^=]{3,})=.*;:\1$trailing_char;" |
    sort |
    tr -d '\n' |
    sed -e 's;^:;;'
)"

export HISTIGNORE
#export HISTIGNORE="bg:cd *:crontab -?:df -h:echo:edit-history:fg*:$([[ -x $(which git) ]] && { for i in $(git config -l | sed -rne 's;^alias\.([^=]+)=.*;\1;p'); do value+="git $i:"; done; echo "${value%:}"; }):git co master:jobs:kill*:ls:list -tr:ping 8.8.8.8:popd:pushd:pwd:screen -r:screen -t *:vim:vim nodes:w:$(alias | sed -rne 's;^alias ([^=]*)=.*;:\1?;p' | sort | tr -d '\n' | sed -e 's;^:;;')"

##########################################################

has starship && {
   #export STARSHIP_CONFIG="${HOME}/.config/starship-main.toml"
   eval "$(starship init ${SHELL_TYPE})"
}
