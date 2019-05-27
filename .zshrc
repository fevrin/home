# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install

# Comment in the above and uncomment this below for a color prompt
if [[ $(id -u) -eq 0 ]]; then
   PS1=$'\n\e\033[00;00m\033[01;31m%n\033[01;33m@%M\033[00m:\033[01;34m%d\033[00m\n\033[01;34m%!\033[00m\$ '
else
   autoload -U colors && colors
   PS1=$'\n'"%B%{$fg[green]%}%n%{$fg[yellow]%}@%M$reset_color%}:%B%{$fg[blue]%}%~"$'\n'"%!%{$reset_color%}\$ "
fi
