#!/usr/bin/env zsh

# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'


# consider this:
# https://thevaluable.dev/zsh-completion-guide-examples/
# https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh

# a good comparison between bash and zsh:
# https://apple.stackexchange.com/questions/361870/what-are-the-practical-differences-between-bash-and-zsh/361957#361957

autoload -Uz compinit
compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install

# Comment in the above and uncomment this below for a color prompt
if [[ $(id -u) -eq 0 ]]; then
   PS1=$'\n\e\033[00;00m\033[01;31m%n\033[01;33m@%M\033[00m:\033[01;34m%d\033[00m\n\033[01;34m%!\033[00m\$ '
else
   autoload -U colors && colors
   PS1=$'\n'"%B%{$fg[green]%}%n%{$fg[yellow]%}@%M$reset_color%}:%B%{$fg[blue]%}%~"$'\n'"%!%{$reset_color%}\$ "
fi

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

. ${HOME}/.shellrc.d/base

for file in \
   ${HOME}/.shellrc.d/00_vars \
   ${HOME}/.shellrc.d/aliases_general \
   ${HOME}/.shellrc.d/functions \
   ${HOME}/.shellrc.d/completions \
   ; do
   [[ -r "$file" ]] &&
   [[ ! "$file" =~ python ]] &&
   file -L --mime-type "$file" | egrep -q '(text/x-shellscript|bash_completion)' && # git-sh-prompt shows as 'text/plain'
   zsh -n "$file" 2>/dev/null &&
#   echo "sourcing '$file'..." >&2 &&
#   TIMEFORMAT='%R' &&
#   time . "$file"
   . "$file"
done

# 'bare-metal' plugin system:
# https://github.com/mattmc3/zsh_unplugged#jigsaw-the-humble-plugin-load-function

##? Clone a plugin, identify its init file, source it, and add it to your fpath.
plugin-load() {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

plugin-update() {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

plugins+=(
    asdf-vm/asdf.git                           # runtime version manager
    romkatv/zsh-defer                          # this defers the remaining plugins to background async execution
    Aloxaf/fzf-tab                             # this adds fuzzy finder tab completion (interactive completion list)
    zsh-users/zsh-autosuggestions              # this shows you auto-suggested completions; complete with Esc > Space
    zdharma-continuum/fast-syntax-highlighting # feature-rich syntax highlighting for zsh
)

plugin-load $plugins
unset plugins

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'

# Set shell options
# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt glob_dots            # no special treatment for file names with a leading dot
setopt no_auto_menu         # require an extra TAB press to open the completion menu
setopt no_beep              #
setopt prompt_subst         #
setopt inc_append_history   #
setopt share_history        #
setopt hist_ignore_space    #
setopt no_nomatch           #
setopt interactive_comments #
setopt hash_list_all        #
setopt complete_in_word     #
setopt noflowcontrol        #
setopt appendhistory        #
setopt extendedhistory      # put timestamps in command history
setopt histignorealldups    # ignore dups in history

# keep completions listed on screen after executing command
# this doesn't seem to make a diff, as-is
setopt no_always_last_prompt

# have array indexing start at 0
# this was causing some issues with autocompletion giving this error:
# -ftb-complete:7: bad output format specification
#setopt ksh_arrays

# don't print an inverse bold '%' character at the end of a line that has no newline
# https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol#comment822112_167600
export PROMPT_EOL_MARK=''

# use vi style line controls
bindkey -v

# complete in the middle of a word
# https://zsh.sourceforge.io/FAQ/zshfaq04.html#l50
#bindkey '	' complete-word
bindkey '	' expand-or-complete-prefix

#bindkey '	' autosuggest-accept
# this ensures using vi-style keys for navigating command history start the cursor at the beginning of the line, like in bash
# from <https://unix.stackexchange.com/questions/562292/zsh-history-with-cursor-at-beginning-of-line/591511#591511>
bindkey -a j vi-down-line-or-history
bindkey -a k vi-up-line-or-history

# use 'v' to edit the current command in vim, just like in bash
# from <https://unix.stackexchange.com/questions/6620/how-to-edit-command-line-in-full-screen-editor-in-zsh/6622#6622>
autoload -z edit-command-line; zle -N edit-command-line
zstyle :zle:edit-command-line editor vim
bindkey -a v edit-command-line

# Autoload functions
autoload -Uz zmv

# Interactive Shell Environment Variables:
export SAVEHIST="${HISTSIZE}"
export HISTFILE=${HOME}/.zsh-history

# referenced here:
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=1


# have the redirect operator '>' null a file instead of act as catting into it
# from:
# <https://zsh.sourceforge.io/Doc/Release/Redirection.html#Redirection:~:text=7.3%20Redirections%20with%20no%20command>
# <https://zsh.sourceforge.io/Doc/Release/Options.html#Description-of-Options:~:text=%E2%80%99%20will%20work.-,SH_NULLCMD%20%3CK%3E%20%3CS%3E,-Do%20not%20use>
set -o shnullcmd
#export NULLCMD=:
if has vim; then
  export EDITOR=vim
  export GIT_EDITOR="${EDITOR}"
elif has nvim; then
  export EDITOR=nvim
  export GIT_EDITOR="${EDITOR}"
elif has code; then
  VSCODE_BIN="$(which code)"
  export EDITOR="$VSCODE_BIN"
  export GIT_EDITOR="$VSCODE_BIN -w"
  sucode() {
    EDITOR="$VSCODE_BIN -w" command -- sudo -e "$@"
  }
elif has nano; then
  export EDITOR=nano
elif has emacs; then
  printf "${RED}WARNING:${END_COLOR} setting nano as the fallback editor.\n"
  export EDITOR=emacs
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C ${BIN_DIR}/vault vault

complete -o nospace -C /home/cweeks/go/bin/gocomplete go

complete -o nospace -C /usr/bin/vault vault


# this should be at the end
has starship && {
   export STARSHIP_SHELL="${SHELL_TYPE}"
   eval "$(starship init zsh)"
}
