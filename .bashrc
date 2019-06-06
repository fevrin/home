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

# Comment in the above and uncomment this below for a color prompt
if [[ $(id -u) -eq 0 ]]; then
   PS1='\n${debian_chroot:+($debian_chroot)}\033[00;00m\[\033[01;31m\]\u\[\033[01;33m\]@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;34m\]\!\[\033[00m\]\$ '
else
   if [[ -f /usr/lib/git-core/git-sh-prompt || -f /usr/local/git/contrib/completion/git-prompt.sh ]]; then
      export GIT_PS1_SHOWDIRTYSTATE=true
      export GIT_PS1_SHOWUNTRACKEDFILES=true
      export GIT_PS1_SHOWCOLORHINTS=true
   
      # append history commands to ~/.bash_history as they are executed;
      #from <http://www.ukuug.org/events/linux2003/papers/bash_tips/>.  also, read in latest bash history
      # inspired by <https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history/18443#18443>
      # that recommends the following, which seems to just endlessly adding duplicate commands to individual entries:
      # per the git-sh-prompt file notes, __git_ps1 automatically sets PS1 with the provided values
      # history -n;
      # history -w;
      # history -c;
      # history -r;

      export PROMPT_COMMAND='
      history -a;
      history -c;
      history -r;
      history -w;
      __git_ps1 \
      "\n$(colorize bold green "$USER" bold yellow "@$HOSTNAME" none ":" bold blue "\w")" \
      "\n\D{%F %T %Z}\n\[\033[01;34m\]\!\[\033[00m\]\$ "
      '
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
set -o vi

##########################################################
########Source Files#########
#############################

declare -a files_to_source
declare -a dirs_for_path
declare -a dirs_for_gopath

files_to_source=(
~/.bashrc.d/*
~/bin/lib/lib_all
/etc/bash_completion # needed for git completion, ironically
/usr/lib/git-core/git-sh-prompt
/usr/local/git/contrib/completion/git-prompt.sh
/usr/local/git/contrib/completion/git-completion.bash
)

# prep apple terminal, if we're using it
MAC_OS_X=0
if [[ "$TERM_PROGRAM" = "Apple_Terminal" || "$TERM_PROGRAM" =~ iTerm ]]; then
   MAC_OS_X=1
   files_to_source+=("$HOME/.macrc")
fi

for file in ${files_to_source[*]}; do
   # account for the special config file named "remote", which should
   # be sourced only on remote systems accessed via ssh
   [[ "$file" =~ remote ]] &&
    [[ -z "$SSH_CLIENT" || -z "$SSH_TTY" || -z "$SSH_CONNECTION" ]] &&
    continue

   [[ -r "$file" ]] && . "$file"
done
unset files_to_source file

##########################################################

##########################################################
########Source Dirs##########
#############################

dirs_for_path+=(
~/bin
)

# add a GOPATH value if go's installed
# and add it to the general PATH, as well
if which go &>/dev/null; then
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

# enable color support of ls and also add handy aliases
if [[ "$TERM" != "dumb" && "$TERM_PROGRAM" != "Apple_Terminal" && ! "$TERM_PROGRAM" =~ iTerm ]]; then
   eval "`dircolors -b`"
   alias ls='ls --color=auto'
   #alias dir='ls --color=auto --format=vertical'
   #alias vdir='ls --color=auto --format=long'
fi

# ignore same sucessive entries and delete duplicate lines in history.
export HISTCONTROL="erasedups:ignoreboth"

# include timestamps for all commands
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# remember many more than the default of 500 history commands
export HISTSIZE=20000
# this must be set really high or not set at all; it seems as of bash version 4.4.19(1)-release, having the history file larger than this size causes a segfault
#export HISTFILESIZE=20000

# don't remember basic/common commands, including all bash aliases
# i really need to make a level 0/level 6 script using perl or something to have greater control over regexes; plus, it can be annoying to have the commands immediately removed; lastly, duplicates aren't always removed like they should be
export HISTIGNORE="bg:cd *:crontab -?:df -h:echo:edit-history:fg*:git br:git co master:git df:git diff:git lg1:git pull:git st:jobs:kill*:ls:list -tr:ping 8.8.8.8:popd:pushd:pwd:screen -r:screen -t *:vim:vim nodes:w:$(alias | sed -rne 's;^alias ([^=]*)=.*;:\1?;p' | sort | tr -d '\n')"

# ensure vim is the default editor of choice
export EDITOR="vim"
export LESS="QFRX"

# set default pager for manpages to "less -Qc" so the terminal bell doesn't ring and refreshes from the top instead of the bottom
export MANPAGER="less -$(echo $LESS)"

# don't overwrite ~/.bash_history file upon logging out
shopt -s histappend

# needed to ensure windows aren't open if it's not desired
# invoke no windows using a command like `SCREEN_CONF= screen`
# from <https://pbrisbin.com/posts/screen_tricks/>
export SCREEN_CONF="$HOME/.screenrc_main"

# start screen upon login only if screen is not already opened and there
#are no detached sessions
SHLVL_threshold=1
# always use just "screen" as the terminal so servers don't go ballistic
# ugh, `export TERM=screen` causes weird stuff on the local machine, like italicizing text instead of highlighting it when copying using screen's commands
#export TERM=screen
# open a new screen session if we're not already using screen
[[ ! $TERM =~ screen && $(env | sed -n "s;SHLVL=\([1-9][1-9]*\);\1;p") = $SHLVL_threshold && ! $(screen -ls | grep -i detached) ]] && screen

# list detached screens, if any, to explain why screen wasn't started
SCREEN_LIST=$(screen -ls)
[[ $(echo "$SCREEN_LIST" | grep -i detached) ]] && echo "$SCREEN_LIST"

# read in latest bash history.  for some reason, this must come last (or at least after the "shopt" line);
# otherwise, the timestamps in ~/.bash_history are also considered commands
#history -n
