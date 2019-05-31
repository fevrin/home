# TODO

# CHANGELOG
=======
### v2.0.5
   .bashrc.d/functions  
  \* pushd(): updating to prevent duplicate directories from getting added to the dir stack

### v2.0.4
   .bashrc.d/functions  
  \+ compact_history(): adding

### v2.0.3
   .bashrc  
  \* updating HISTIGNORE for efficiency  
  \- removing unneeded bits

   .bashrc.d/functions  
  \* moving aptuochange() and copy-skey() from .bashrc.d/aliases to here

   .bashrc.d/aliases  
  \- removing unneeded aliases

### v2.0.2
   .bashrc.d/functions  
  \* get-ips(): updating to output contents only when an IP is found

### v2.0.1
   .bashrc  
  \+ adding the $GOBIN variable

   .bashrc.d/functions  
  \* yessh(): updating to copy over all files in ~/.bashrc.d/remote/\*  
  \+ verbose(): adding

   .bashrc.d/remote  
  \* moving to ~/.bashrc.d/remote/remote_base

   .screenrc_main  
  \* updating the default directory for a couple of screens

### v2.0.0
   .bash_colors  
  \- contents moved to .bashrc.d/functions

   .bashrc  
  \* updated sourced files, including an exception for a special ".bashrc.d/remote" file  
  \- moved some general output to .bashrc.d/base

   .bash_aliases  
  \* aliases moved to .bashrc.d/aliases  
  \* functions moved to .bashrc.d/functions

   .bashrc.d/base  
  \+ created

   .bashrc.d/functions  
  \+ created  
  \* diff-home-files(): updated to inspect the new .bashrc.d/ files

   .bashrc_common  
  \* moved to .bashrc.d/remote

   .macrc  
  \+ added several aliases and an array of homebrew packages to install for a more Linux-like experience

   .profile  
  \* updated to include $HOME/.local/bin in $PATH if it exists

### v1.6.7
   .bashrc  
  \* reworked creation of PATH and GOPATH

### v1.6.5
   .bash_aliases  
  \* $ip_regex: updated to include "0" as a valid octet  
  \+ count-ips-from-tcpdump() : added  
  \* get-ips(): updated for more verbose output

   .bashrc_common  
  \* expand the conditions for which the PS1 string is updated

### v1.6.4
   .bash_aliases  
  \+ get-ips: added alias for retrieving assigned IPs  
  \* yessh(): updated to include additional usage information

   .bashrc  
  \- removing HISTFILESIZE assignment since that seems to bomb out Bash in some cases; it seems as of bash version 4.4.19(1)-release, having the history file larger than this size causes a segfault

### v1.6.3
   .bash_aliases  
  \+ adding $ip_regex  
  \+ copy-file-by-line(): adding

   .bashrc_common  
  \+ adding commands to output last login time

### v1.6.2
   .bash_aliases  
  \+ adding calculate-free-mem and calculate-used-mem aliases  
  \+ list-to-quoted-csv(): adding

   .bashrc_common  
  \* fixing the regex for determining if a hostname needs to include the region (in case it doesn't already)

   .gitconfig  
  \+ adding config to by default push to 'origin'  
  \+ adding config to by default not be permitted to push directly to the master branch

### v1.6.1
   .bash_aliases  
  \* updating clipit-copy() to recommend a better alternative  
  \+ adding tabular-to-csv() for converting standard MySQL tabular output to CSV

### v1.6.0
   .bash_aliases  
  \* updating clipit-copy() to actually copy content to the clipboard  
  \* updating yessh() to negate the need for a temporary file (an issue with the target host's disk is full)

   .bashrc_common  
  \* making terminal color setting commands more logical and readable  
  \* making MOTD printing more robust

   .gvimrc  
  \* updating config to include standard Ctrl-C and Ctrl-V keybindings for easier copy and paste

### v1.5.9
   .bash_aliases  
  \* updating clipit-copy() to work properly

   .bashrc_common  
  \* updating PS1 to always have certain colors

### v.1.5.8
   .bash_aliases  
  \* changing the find-broken-links alias to be seek-broken-links() for more flexibility (Bash doesn't like a function starting with the name of a command when it's separated by dashes instead of underscores, it seems)

### v.1.5.7
   .bash_aliases  
  \+ added clipit-copy() to deal with the limited N_TTY_BUF_SIZE value  
  \* updated yessh() to handle ssh options better

   .bashrc_common  
  \* prepended a newline to PS1

   .gitignore_global  
  \+ adding since this apparently wasn't being saved before

### v.1.5.6
   .apple_keyboard_mod.rc  
  \+ adding reset_keyboard() for easier resetting  
  \* disabling left key mods

   .bash_aliases  
  \* updating diff-home-files() to ignore vim swap files  
  \* updating find-dupes() to output file and file size to better pinpoint large duplicates

   .bashrc  
  \+ adding conditional to determine if the system is running Mac OS X

   .bashrc_common  
  \+ specifying vim as the default editor  
  \+ updating the PS1 variable to include region name, if needed, as well as some color

### v1.5.4
   .bash_aliases  
  \* addressing Mac OS X compatibility

   .bashrc  
  \* addressing Mac OS X compatibility

   .bashrc_common  
  \* addressing Mac OS X compatibility

### v1.5.3
   .bash_aliases  
  \* fixing yessh() to better handle cases when the port or username is supplied (rather than using the defaults)

### v1.5.2
   .bashrc_common  
  \+ adding vimrc config

### v1.5.1
   .bash_aliases  
  \* fixing a filename

   .bashrc_common  
  \* correcting stderr redirection  
  \* updating an alias to always use color output

### v1.5.0
   .bashrc  
  \* updated terminal environment when using screen

   etc/sudoers  
  \+ added to document `timestapm_type=global` (super handy!)

   var/spool/cron/crontabs/username  
 \+ added for tracking handy cron jobs

   .bash_aliases  
  \* properly scoping variables  
  \+ added find-dupes() for finding files sharing the same name in the given directory and its subdirectories  
  \+ added yessh() to source .bashrc_common, enabling use of common basic environment modifications, such as with servers

   .bashrc_common  
  \+ adding to enable use of common basic environment modifications, such as with servers

### v1.4.8
   .bash_aliases  
  \* updated `diff-home-files` to give uesr the chance to create a missing file

### v1.4.7
   .bash_aliases  
  \+ added `fix-broken-links` and `make-broken-link-table`

### v1.4.6
   .bash_aliases  
  \* updated `apt-history`

### v1.4.5
   .bashrc  
  \* updated HISTIGNORE

   .bash_aliases  
  \+ added img2pdf()

### v1.4.4
   .screenrc_main  
  \* changed main directory

### v1.4.3
   .macrc  
  \+ added `edit-history` alias  
  \+ added code to prevent Finder from showing up in the app switcher

### v1.4.2
   .macrc  
  \+ added code to set banner notification timeout to 3s

### v1.4.1  
   .bash_aliases  
  \* updated the conditional in `diff-home-files` for accuracy

### v1.4.0
   .bashrc  
  \+ added timestamp to PS1 prompt string

### v1.3.9
   .bashrc  
  \+ adding lines to remove extraneous stuff from $PATH  
  \* update conditions under which ~/.macrc will be invoked  
  \* updated code for adding dirs to PATH

   .bash_aliases  
  \* updated `diff-home-files` to include .gitignore_global  
  \+ added get-vb-ip()

   .gitconfig  
  \+ enabled rerere (reuse recorded resolution for merge conflicts)

   .macrc  
  \* update conditions under which ~/.macrc will be invoked  
  \+ added some code for Mac-specific mods to PATH

### v1.3.8
   .bashrc  
  \* some changes to support Ubuntu 16.10 now starting at SHLVL 2  
  \* corrected logic for when to display .bash_history size message

   .bash_aliases  
  \+ added `edit-history` to automate unsetting and resetting append mode of .bash_history when editing it  
  \+ added `apt-history` to display apt history in a more readable format

### v1.3.7
   .apple_keyboard_mod.rc  
  \* re-arranged logic to work better on all hardware

   .bashrc  
  \* updated check for existing screen sessions for compatibility  
  \+ added a check for .bash_history's append-only mode status  
  \+ added a check for .bash_history's size, as it can grow large in append-only mode

   .screenrc_main  
  \+ appended directories with forward slashes

### v1.3.6
   .gitconfig  
   \+ added 'dfs' and 'diffs' aliases for diffing staged files

   .bashrc  
   \+ added sourcing of the git completion file on Mac OS X  
   \* updated the screenrc file path to work with Mac OS X

### v1.3.5
   .toprc  
   \* updated to include full commands and arguments

   .bash_aliases  
   \* updated pushd() to better handle day-to-day usage  
   \* updated dirs alias to be simpler and correspond with the updated pushd()  
   \+ added popd(), similar to pushd()

### v1.3.4
   added these files:  
   \* .screenrc_main  
   \* CHANGELOG.md.tpl  
   \* README.md.tpl

   .screenrc  
   \* removed all window commands to instead source .screenrc_main.  this permits a dynamic configuration

   .bashrc  
   \+ added code to export a screenrc config file in conjunction with the new screenrc changes

   .bash_aliases  
   \+ added a dirs alias  
   \+ added a pushd() function

### v1.3.3
   .gitignore_global  
   \+ added

   .gitconfig  
   \+ added gitignore file setting
### v1.3.2
   .bashrc  
   \* updated to source lib_all instead of just lib_main

   .editrc  
   \+ added (mainly to ensure MySQL uses vi keybindings)

### v1.3.1
   .bashrc  
   \+ added work aliases in ~/.bash_work_aliases
   
   .macrc  
   \+ added an alias for md5sum
