# TODO

# CHANGELOG
-------
### v2.1.0
##### Fri, Jun 14, 2019

   .bashrc  
  \* skip directories when finding files to source

   .bashrc.d/aliases  
  \+ num-file: added for numbering lines in a file

   .bashrc.d/aliases_laptop  
  \+ added for including aliases relevant mainly on laptops (like battery percentage)

   .bashrc.d/functions_dns  
  \+ added for DNS-related functions

   .bashrc.d/functions_net  
  \+ added for network-related functions

   .bashrc.d/functions_sec  
  \+ added for security-related functions

   .bashrc.d/functions  
  \* renamed to be .bashrc.d/functions_general to differentiate with other function categories  
  \+ time-between-now-and(): added for calcaulting relative time differences

### v2.0.9
##### Wed, Jun 12, 2019

   .bashrc.d/vars  
   * renamed to be .bashrc.d/00_vars

   .bashrc  
   * moved some content to .bashrc.d/base

   .bashrc.d/aliases  
   - removed some outdated and unused aliases

   .apple_keyboard_mod.rc  
   * unset a variable so it doesn't show up in the environment needlessly

   .bashrc.d/functions  
  \+ added code to unset a variable after exporting the functions  
  \+ _verify_reqs(): added for verifying functions' requirements to run  
  \+ _print_var_vals(): added  
     compact_history():  
     \+ added support for an immutable history file  
     \+ added support for removing history entries matching a given regex  
     \+ added support for simulating a run  
     yessh():  
     \* updating information on which files are sourced  
     \* updating verbosity levels for certain messages  
     \+ added requirements  
     colorize():  
     \* localized variables  
     \+ added the ability to accept input from stdin

### v2.0.7
##### Mon, Jun 10, 2019

   .bashrc.d/functions  
  \* added exception so pushd() is not exported when other functions are  
     yessh():  
    \+ added support for verbose()  
    \* updated to permit simply running a command instead of logging into the command line  
     verbose():  
    \+ added support for brief verbosity level descriptions instead of just numbers

   .my.cnf  
  \+ added skip-reconnect to avoid potentially disastrous queries

### v2.0.6
##### Tue, Jun 04, 2019

   .bashrc.d/functions  
     pushd():  
    \* simplified duplicate directory check  
    \+ added another conditional to short circuit exit if the user provides an invalid directory  
     yessh():  
    \+ added functionality to just copy the config over to the target server as a temporary file if it's of a certain size (as was done before the base64 technique, though we now use base64 for it, too)  
    \* updated config transfer to incorporate bzip2 compression to further reduce network bandwidth usage  
  \+ sql-tab-to-jira-tab(): added  
  \+ generate_luks_keyfile(): moved from lib_sec  
  \+ added code to automatically export all functions within the file  

### v2.0.5
##### Thu May 30 22:40:55 2019 -0400

   .bashrc.d/functions  
  \* pushd(): updated to prevent duplicate directories from getting added to the dir stack

### v2.0.4
##### Wed May 29 19:10:03 2019 -0400

   .bashrc.d/functions  
  \+ compact_history(): added

### v2.0.3
##### Mon May 27 00:58:28 2019 -0400

   .bashrc  
  \* updated HISTIGNORE for efficiency  
  \- removed unneeded bits

   .bashrc.d/functions  
  \* moved aptupchange() and copy-skey() from .bashrc.d/aliases to here

   .bashrc.d/aliases  
  \- removed unneeded aliases

### v2.0.2
##### Sat May 25 23:31:06 2019 -0400

   .bashrc.d/functions  
  \* get-ips(): updated to output contents only when an IP is found

### v2.0.1
##### Tue May 21 19:41:57 2019 -0400

   .bashrc  
  \+ added the $GOBIN variable

   .bashrc.d/functions  
  \* yessh(): updated to copy over all files in ~/.bashrc.d/remote/\*  
  \+ verbose(): added

   .bashrc.d/remote  
  \* moved to ~/.bashrc.d/remote/remote_base

   .screenrc_main  
  \* updated the default directory for a couple of screens

### v2.0.0
##### Wed May 15 20:56:26 2019 -0400

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
##### Mon May 13 20:56:57 2019 -0400

   .bashrc  
  \* reworked creation of PATH and GOPATH

### v1.6.5
##### Thu May 9 20:52:20 2019 -0400

   .bash_aliases  
  \* $ip_regex: updated to include "0" as a valid octet  
  \+ count-ips-from-tcpdump() : added  
  \* get-ips(): updated for more verbose output

   .bashrc_common  
  \* expand the conditions for which the PS1 string is updated

### v1.6.4
##### Wed Apr 24 18:29:14 2019 -0400

   .bash_aliases  
  \+ get-ips: added alias for retrieving assigned IPs  
  \* yessh(): updated to include additional usage information

   .bashrc  
  \- removed HISTFILESIZE assignment since that seems to bomb out Bash in some cases; it seems as of bash version 4.4.19(1)-release, having the history file larger than this size causes a segfault

### v1.6.3
##### Sat Apr 13 01:35:49 2019 -0400

   .bash_aliases  
  \+ added $ip_regex  
  \+ copy-file-by-line(): added

   .bashrc_common  
  \+ added commands to output last login time

### v1.6.2
##### Thu Apr 11 21:19:04 2019 -0400

   .bash_aliases  
  \+ added calculate-free-mem and calculate-used-mem aliases  
  \+ list-to-quoted-csv(): added

   .bashrc_common  
  \* fixed the regex for determining if a hostname needs to include the region (in case it doesn't already)

   .gitconfig  
  \+ added config to by default push to 'origin'  
  \+ added config to by default not be permitted to push directly to the master branch

### v1.6.1
##### Wed Apr 3 22:06:48 2019 -0400

   .bash_aliases  
  \* updated clipit-copy() to recommend a better alternative  
  \+ added tabular-to-csv() for converting standard MySQL tabular output to CSV

### v1.6.0
##### Wed Mar 27 17:44:28 2019 -0400

   .bash_aliases  
  \* updated clipit-copy() to actually copy content to the clipboard  
  \* updated yessh() to negate the need for a temporary file (an issue when the target host's disk is full)

   .bashrc_common  
  \* make terminal color setting commands more logical and readable  
  \* make MOTD printing more robust

   .gvimrc  
  \* updated config to include standard Ctrl-C and Ctrl-V keybindings for easier copy and paste

### v1.5.9
##### Fri Mar 8 00:46:18 2019 -0500

   .bash_aliases  
  \* updated clipit-copy() to work properly

   .bashrc_common  
  \* updated PS1 to always have certain colors

### v.1.5.8
##### Wed Mar 6 23:36:26 2019 -0500

   .bash_aliases  
  \* changed the find-broken-links alias to be seek-broken-links() for more flexibility (Bash doesn't like a function starting with the name of a command when it's separated by dashes instead of underscores, it seems)

### v.1.5.7
##### Wed Mar 6 00:14:44 2019 -0500
   .bash_aliases  
  \+ added clipit-copy() to deal with the limited N_TTY_BUF_SIZE value  
  \* updated yessh() to handle ssh options better

   .bashrc_common  
  \* prepended a newline to PS1

   .gitignore_global  
  \+ added since this apparently wasn't being saved before

### v.1.5.6
##### Mon Mar 4 01:22:26 2019 -0500

   .apple_keyboard_mod.rc  
  \+ added reset_keyboard() for easier resetting  
  \* disabled left key mods

   .bash_aliases  
  \* updated diff-home-files() to ignore vim swap files  
  \* updated find-dupes() to output file and file size to better pinpoint large duplicates

   .bashrc  
  \+ added conditional to determine if the system is running Mac OS X

   .bashrc_common  
  \+ specified vim as the default editor  
  \+ updated the PS1 variable to include region name, if needed, as well as some color

### v1.5.4
##### Mon Feb 18 18:42:57 2019 -0500

   .bash_aliases  
  \* addressed Mac OS X compatibility

   .bashrc  
  \* addressed Mac OS X compatibility

   .bashrc_common  
  \* addressed Mac OS X compatibility

### v1.5.3
##### Fri Feb 15 01:50:11 2019 -0500

   .bash_aliases  
  \* fixed yessh() to better handle cases when the port or username is supplied (rather than using the defaults)

### v1.5.2
##### Tue Feb 12 23:14:59 2019 -0500

   .bashrc_common  
  \+ added vimrc config

### v1.5.1
##### Mon Feb 11 18:35:10 2019 -0500

   .bash_aliases  
  \* fixed a filename

   .bashrc_common  
  \* corrected stderr redirection  
  \* updated an alias to always use color output

### v1.5.0
##### Sun Feb 10 19:11:16 2019 -0500

   .bashrc  
  \* updated terminal environment when using screen

   etc/sudoers  
  \+ added to document `timestapm_type=global` (super handy!)

   var/spool/cron/crontabs/username  
 \+ added for tracking handy cron jobs

   .bash_aliases  
  \* scoped variables properly  
  \+ added find-dupes() for finding files sharing the same name in the given directory and its subdirectories  
  \+ added yessh() to source .bashrc_common, enabling use of common basic environment modifications, such as with servers

   .bashrc_common  
  \+ added to enable use of common basic environment modifications, such as with servers

### v1.4.8
##### Sun Jan 13 21:13:37 2019 -0500

   .bash_aliases  
  \* updated `diff-home-files` to give uesr the chance to create a missing file

### v1.4.7
##### Tue Jun 19 21:10:18 2018 -0400

   .bash_aliases  
  \+ added `fix-broken-links` and `make-broken-link-table`

### v1.4.6
##### Thu May 10 21:13:09 2018 -0400

   .bash_aliases  
  \* updated `apt-history`

### v1.4.5
##### Tue May 1 22:01:35 2018 -0400

   .bashrc  
  \* updated HISTIGNORE

   .bash_aliases  
  \+ added img2pdf()

### v1.4.4
##### Tue Apr 24 22:07:59 2018 -0400

   .screenrc_main  
  \* changed main directory

### v1.4.3
##### Wed Apr 18 16:35:57 2018 -0400

   .macrc  
  \+ added `edit-history` alias  
  \+ added code to prevent Finder from showing up in the app switcher

### v1.4.2
##### Thu Sep 7 20:01:26 2017 -0400

   .macrc  
  \+ added code to set banner notification timeout to 3s

### v1.4.1  
##### Wed Jul 19 19:31:19 2017 -0400

   .bash_aliases  
  \* updated the conditional in `diff-home-files` for accuracy

### v1.4.0
##### Tue Jul 4 22:51:25 2017 -0400

   .bashrc  
  \+ added timestamp to PS1 prompt string

### v1.3.9
##### Thu Jun 1 18:06:37 2017 -0400

   .bashrc  
  \+ added lines to remove extraneous stuff from $PATH  
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
##### Tue May 30 17:07:37 2017 -0400

   .bashrc  
  \* some changes to support Ubuntu 16.10 now starting at SHLVL 2  
  \* corrected logic for when to display .bash_history size message

   .bash_aliases  
  \+ added `edit-history` to automate unsetting and resetting append mode of .bash_history when editing it  
  \+ added `apt-history` to display apt history in a more readable format

### v1.3.7
##### Sun Oct 30 22:10:00 2016 -0400

   .apple_keyboard_mod.rc  
  \* re-arranged logic to work better on all hardware

   .bashrc  
  \* updated check for existing screen sessions for compatibility  
  \+ added a check for .bash_history's append-only mode status  
  \+ added a check for .bash_history's size, as it can grow large in append-only mode

   .screenrc_main  
  \+ appended directories with forward slashes

### v1.3.6
##### Tue Oct 13 12:56:44 2015 -0400

   .gitconfig  
   \+ added 'dfs' and 'diffs' aliases for diffing staged files

   .bashrc  
   \+ added sourcing of the git completion file on Mac OS X  
   \* updated the screenrc file path to work with Mac OS X

### v1.3.5
##### Tue Sep 22 21:03:44 2015 -0400

   .toprc  
   \* updated to include full commands and arguments

   .bash_aliases  
   \* updated pushd() to better handle day-to-day usage  
   \* updated dirs alias to be simpler and correspond with the updated pushd()  
   \+ added popd(), similar to pushd()

### v1.3.4
##### Mon Sep 21 23:02:37 2015 -0400

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
##### Sun Sep 13 18:41:53 2015 -0400

   .gitignore_global  
   \+ added

   .gitconfig  
   \+ added gitignore file setting
### v1.3.2
##### Tue Aug 4 15:12:19 2015 -0400

   .bashrc  
   \* updated to source lib_all instead of just lib_main

   .editrc  
   \+ added (mainly to ensure MySQL uses vi keybindings)

### v1.3.1
##### Wed Jul 29 03:21:47 2015 -0400

   .bashrc  
   \+ added work aliases in ~/.bash_work_aliases
   
   .macrc  
   \+ added an alias for md5sum
