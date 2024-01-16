# CHANGELOG

## v3.1.0

### 2024-01-16 (Tue, Jan 16, 2024)
* fix: rename directory in example

### 2024-01-16 (Tue, Jan 16, 2024)
* feat: add image aliases and ensure containers are removed after use

### 2024-01-16 (Tue, Jan 16, 2024)
* fix: move single quote so it's colorized

### 2024-01-16 (Tue, Jan 16, 2024)
* feat: add some safety checks and modularize some code

### 2024-01-16 (Tue, Jan 16, 2024)
* feat: update copyq font configuration

### 2024-01-16 (Tue, Jan 16, 2024)
* feat: add default binary dir in home dir and prevent path dupes

### 2024-01-16 (Tue, Jan 16, 2024)
* fix: text width value for git commits

### 2023-09-29 (Fri, Sep 29, 2023)
* fix: consider only a subset of headers for ToCs in Markdown files

### 2023-09-27 (Wed, Sep 27, 2023)
* fix: update an editorconfig directive to properly match git commit files

### 2023-09-22 (Fri, Sep 22, 2023)
* style: remove extra whitespace

### 2023-09-20 (Wed, Sep 20, 2023)
* fix: 'base' file syntax

### 2023-09-21 (Thu, Sep 21, 2023)
* style: add effective whitespace

### 2023-09-21 (Thu, Sep 21, 2023)
* feat: update htoprc

### 2023-09-21 (Thu, Sep 21, 2023)
* refactor: rename htoprc

### 2023-09-22 (Fri, Sep 22, 2023)
* fix: specify 'LANG' value to avoid unexpected 'sort' output

### 2023-09-21 (Thu, Sep 21, 2023)
* docs: update Makefile help content

### 2023-09-21 (Thu, Sep 21, 2023)
* style: add effective whitespace

### 2023-09-21 (Thu, Sep 21, 2023)
* feat: update Makefile targets for working with 'pre-commit'

### 2023-09-21 (Thu, Sep 21, 2023)
* refactor: move 'makefile_help.sh' to 'ci/scripts/'

### 2023-09-19 (Tue, Sep 19, 2023)
* fix: zsh 'pushd' function

* Apparently, using empty quotes as a directory duplicates the current
directory in the directory stack

### 2023-09-19 (Tue, Sep 19, 2023)
* feat: add script to change the GNOME desktop theme depending on the time

### 2023-09-19 (Tue, Sep 19, 2023)
* feat: add copyq configuration

### 2023-09-19 (Tue, Sep 19, 2023)
* fix: syntax issues and linting

### 2023-09-16 (Sat, Sep 16, 2023)
* feat: remove unused Align vim plugin (EasyAlign is more up-to-date)

### 2023-09-16 (Sat, Sep 16, 2023)
* fix: various syntax fixes

### 2023-09-16 (Sat, Sep 16, 2023)
* style: reduce line length to conform with editorconfig

### 2023-09-16 (Sat, Sep 16, 2023)
* style: prefer double quoting variables (SC2248)

### 2023-09-16 (Sat, Sep 16, 2023)
* style: prefer putting braces around Bash variable names (SC2250)

### 2023-09-15 (Fri, Sep 15, 2023)
* fix: update shellcheck arguments for parity between linters

### 2023-09-15 (Fri, Sep 15, 2023)
* style: update formatting in README.md

### 2023-09-15 (Fri, Sep 15, 2023)
* refactor: use recommended alternative to 'always()'

* Per:
https://docs.github.com/en/actions/learn-github-actions/expressions#always

### 2023-09-15 (Fri, Sep 15, 2023)
* feat: run all MegaLinter linters when using 'nektos/act'

### 2023-09-15 (Fri, Sep 15, 2023)
* ci: split out pre-commit local vs. CI jobs

### 2023-09-15 (Fri, Sep 15, 2023)
* docs: update wording in contributing guidelines

## v3.0.0

### 2023-09-14 (Thu, Sep 14, 2023)
* style: shorten command lines to pass editorconfig-checker

### 2023-09-14 (Thu, Sep 14, 2023)
* refactor: move vpn functions to 'functions_net'

### 2023-09-14 (Thu, Sep 14, 2023)
* docs: add another example of 'inotifywait' for quick, iterative updates

### 2023-09-14 (Thu, Sep 14, 2023)
* feat: enable 'lychee' linter (link checker)

### 2023-09-13 (Wed, Sep 13, 2023)
* fix: explicitly specify editorconfig-checker config file location

### 2023-09-13 (Wed, Sep 13, 2023)
* fix: make corrections for shellcheck

### 2023-09-13 (Wed, Sep 13, 2023)
* style: update whitespace formatting

### 2023-09-13 (Wed, Sep 13, 2023)
* fix: update `.bashrc.d` references to be '.shellrc.d'

### 2023-09-13 (Wed, Sep 13, 2023)
* style: correct some formatting

### 2023-09-13 (Wed, Sep 13, 2023)
* style: finish a sentence about linting

### 2023-09-13 (Wed, Sep 13, 2023)
* style: prettify json

### 2023-09-13 (Wed, Sep 13, 2023)
* style: fix end of files

### 2023-09-13 (Wed, Sep 13, 2023)
* feat: update editorconfig-checker's excluded files

### 2023-09-13 (Wed, Sep 13, 2023)
* style: update editorconfig to not prescribe a default indent style

### 2023-09-13 (Wed, Sep 13, 2023)
* fix: update toprc values

### 2023-09-13 (Wed, Sep 13, 2023)
* fix: move '.toprc' to modern location

### 2023-09-12 (Tue, Sep 12, 2023)
* style: fix long line lengths

### 2023-09-11 (Mon, Sep 11, 2023)
* style: add syntax highlighting for 'make help' documentation

### 2023-09-11 (Mon, Sep 11, 2023)
* docs(README): add linting documentation

### 2023-09-11 (Mon, Sep 11, 2023)
* style: updated regenerated README.md

### 2023-09-11 (Mon, Sep 11, 2023)
* feat: change tmux pane resize keybinding increments to be 5

### 2023-09-11 (Mon, Sep 11, 2023)
* style: update editorconfig styles for specific filetypes

### 2023-09-11 (Mon, Sep 11, 2023)
* style: fix long line lengths

### 2023-09-09 (Sat, Sep 09, 2023)
* feat: add editorconfig-checker configuration and update editorconfig

### 2023-09-09 (Sat, Sep 09, 2023)
* style: some style updates to match editorconfig config

### 2023-09-09 (Sat, Sep 09, 2023)
* feat: add editorconfig-checker pre-commit hook

### 2023-09-08 (Fri, Sep 08, 2023)
* fix: correct version of MegaLinter noted

### 2023-09-07 (Thu, Sep 07, 2023)
* feat: update prettier to write changes

### 2023-09-07 (Thu, Sep 07, 2023)
* feat: pin versions of GitHub Actions

### 2023-09-07 (Thu, Sep 07, 2023)
* feat: remove toggle for enabling MegaLinter; now, it always runs

### 2023-09-07 (Thu, Sep 07, 2023)
* feat: enable more MegaLinter linters

### 2023-09-07 (Thu, Sep 07, 2023)
* style: prettier linting

### 2023-09-07 (Thu, Sep 07, 2023)
* fix: argument mixture of string and array (SC2145)

### 2023-09-07 (Thu, Sep 07, 2023)
* fix: some bugs from adding support for zsh in 16549d4

### 2023-09-07 (Thu, Sep 07, 2023)
* fix: change GitHub link to be a permalink

### 2023-09-06 (Wed, Sep 06, 2023)
* feat: increase shellcheck's wiki link count to 50

### 2023-09-06 (Wed, Sep 06, 2023)
* feat: have shellcheck fail only on error

### 2023-09-06 (Wed, Sep 06, 2023)
* feat: enable more linters and ignore an actionlint error

### 2023-09-06 (Wed, Sep 06, 2023)
* fix: various corrections, per shellcheck

### 2023-09-06 (Wed, Sep 06, 2023)
* fix: update MegaLinter regex filter for shellcheck

### 2023-09-05 (Tue, Sep 05, 2023)
* style: add quotes and whitespace

### 2023-09-05 (Tue, Sep 05, 2023)
* feat: update actions/checkout to v4

### 2023-09-04 (Mon, Sep 04, 2023)
* feat: have shellcheck show only errors

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: double quote variables (SC2086)

### 2023-09-04 (Mon, Sep 04, 2023)
* style: prefer putting braces around Bash variable names (SC2250)

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: test braces (SC2292)

### 2023-09-04 (Mon, Sep 04, 2023)
* style: add comment for a shellcheckrc directive

### 2023-09-04 (Mon, Sep 04, 2023)
* feat: update MegaLint shellcheck configuration to include more files

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: remove unnecessary dependency for MegaLint

### 2023-09-04 (Mon, Sep 04, 2023)
* refactor: optimize determining the file list that MegaLinter should use

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: environment variable used by MegaLinter

### 2023-09-04 (Mon, Sep 04, 2023)
* feat: add shellcheck wiki links and sort MegaLinter options

### 2023-09-04 (Mon, Sep 04, 2023)
* style: wrap yaml lines to meet desired text width

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: exclude 'zsh' files again since shellcheck otherwise complains

### 2023-09-04 (Mon, Sep 04, 2023)
* feat: move shellcheckrc and update MegaLinter to support new location

### 2023-09-04 (Mon, Sep 04, 2023)
* feat: add basic zshrc linting

### 2023-09-04 (Mon, Sep 04, 2023)
* feat: update MegaLinter to lint only changed files

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: source necessary file

### 2023-09-04 (Mon, Sep 04, 2023)
* fix: update filename path

### 2023-09-04 (Mon, Sep 04, 2023)
* style: add double quotes around variable references

### 2023-09-04 (Mon, Sep 04, 2023)
* style: add curly braces around variable references

### 2023-09-03 (Sun, Sep 03, 2023)
* feat: update Mega-Linter and related configs

### 2023-09-03 (Sun, Sep 03, 2023)
* fix: change env dump syntax

### 2023-09-03 (Sun, Sep 03, 2023)
* fix: some misspellings

### 2023-09-02 (Sat, Sep 02, 2023)
* style: remove unnecessary semicolons

### 2023-09-02 (Sat, Sep 02, 2023)
* fix: bug in for loop

### 2023-09-01 (Fri, Sep 01, 2023)
* feat: add initial Mega Linter configuration

### 2023-09-01 (Fri, Sep 01, 2023)
* style: add document headers to YAML files

### 2023-09-01 (Fri, Sep 01, 2023)
* feat: enable editorconfig plugin for vim

### 2023-09-01 (Fri, Sep 01, 2023)
* style: add max line length for git commit message

### 2023-09-01 (Fri, Sep 01, 2023)
* style: update headings and remove TODO from CHANGELOG files

### 2023-09-01 (Fri, Sep 01, 2023)
* feat: utilize vim modelines in templates but strip them from output

### 2023-09-01 (Fri, Sep 01, 2023)
* style: give python installation step a name

### 2023-09-01 (Fri, Sep 01, 2023)
* fix: remove unused pre-commit 'double-quote-string-fixer' hook

### 2023-09-01 (Fri, Sep 01, 2023)
* style: reorganize editorconfig and update based on Super-Linter's

### 2023-08-31 (Thu, Aug 31, 2023)
* style: rename step to install packages for nektos/act

### 2023-08-31 (Thu, Aug 31, 2023)
* style: remove some whitespace

### 2023-08-30 (Wed, Aug 30, 2023)
* fix: remove 'pretty-format-json' option that was overriding another

* Also remove some unnecessary comments

### 2023-08-30 (Wed, Aug 30, 2023)
* style: update error message if .pre-commit-config.yaml is unstaged

### 2023-08-30 (Wed, Aug 30, 2023)
* style: add a line of separation

### 2023-08-30 (Wed, Aug 30, 2023)
* fix: step to stop execution if .pre-commit-config.yaml is unstaged

### 2023-08-30 (Wed, Aug 30, 2023)
* feat: make pre-commit verbose an correct 'check-readme' output

### 2023-08-30 (Wed, Aug 30, 2023)
* feat: add explanatory comments to commitlint config

### 2023-08-29 (Tue, Aug 29, 2023)
* refactor: move .commitlintrc to yaml and update preferences

### 2023-08-29 (Tue, Aug 29, 2023)
* feat: update style config and add more pre-commit configs

### 2023-08-29 (Tue, Aug 29, 2023)
* fix: grammar mistake

### 2023-08-29 (Tue, Aug 29, 2023)
* style: update more whitespacing

### 2023-08-29 (Tue, Aug 29, 2023)
* feat: add .prettierignore

### 2023-08-29 (Tue, Aug 29, 2023)
* style: update quoting

### 2023-08-29 (Tue, Aug 29, 2023)
* style: update whitespacing

### 2023-08-29 (Tue, Aug 29, 2023)
* fix: rearrange editorconfig sections for proper precedence

### 2023-08-29 (Tue, Aug 29, 2023)
* style: add some 'prettier' config options

### 2023-08-29 (Tue, Aug 29, 2023)
* feat: add 'pre-commit' target for running on changed files only

### 2023-08-29 (Tue, Aug 29, 2023)
* feat: update 'prettier' version and don't exclude 'zsh' files checks

### 2023-08-29 (Tue, Aug 29, 2023)
* docs: add a comment noting a useful blog post regarding GHA SHAs

### 2023-08-29 (Tue, Aug 29, 2023)
* style: sort options

### 2023-08-29 (Tue, Aug 29, 2023)
* style: enforce K&R-style braces

### 2023-08-29 (Tue, Aug 29, 2023)
* style: update some style configs

### 2023-08-28 (Mon, Aug 28, 2023)
* style: fix some indenting

### 2023-08-28 (Mon, Aug 28, 2023)
* feat: exit early if .pre-commit-config.yaml is unstaged

### 2023-08-26 (Sat, Aug 26, 2023)
* fix: update references to 'readme' to be 'generate-docs'

### 2023-08-26 (Sat, Aug 26, 2023)
* fix: update CHANGELOG.md.tpl to be compatible with 'generate-docs'

### 2023-08-26 (Sat, Aug 26, 2023)
* feat: rename 'readme' to 'generate-docs' and iterate through all '.tpl's

### 2023-08-26 (Sat, Aug 26, 2023)
* refactor: fully move over to simplified 'check-readme' method

### 2023-08-26 (Sat, Aug 26, 2023)
* refactor: change back from matrix

### 2023-08-26 (Sat, Aug 26, 2023)
* refactor: update 'check-readme' to use a matrix

### 2023-08-25 (Fri, Aug 25, 2023)
* fix: change static file reference in 'sed' command to use a variable

* Also space out 'envsubst' arguments for readability

### 2023-08-25 (Fri, Aug 25, 2023)
* style: move 'help' target

### 2023-08-25 (Fri, Aug 25, 2023)
* feat: add more official pre-commit hooks

### 2023-08-24 (Thu, Aug 24, 2023)
* fix: update 'awk' command to more accurately create table of contents

* Also fix the 'envsubst' command's 'SHELL-FORMAT' variables

### 2023-08-22 (Tue, Aug 22, 2023)
* test: see if quotes fix error

### 2023-08-22 (Tue, Aug 22, 2023)
* feat: give 'check-md-links' a header and error count

### 2023-08-22 (Tue, Aug 22, 2023)
* feat: add 'make check-md-links' to check for undefined links

* As well as unlinked definitions

### 2023-08-22 (Tue, Aug 22, 2023)
* feat: update 'make readme' to support processing multiple files

### 2023-08-21 (Mon, Aug 21, 2023)
* refactor: dynamically determine the checkout fetch-depth

### 2023-08-21 (Mon, Aug 21, 2023)
* fix: correct a couple of conditionals' syntax

### 2023-08-21 (Mon, Aug 21, 2023)
* feat: conditionally fetch all of commits (only for workflow_dispatch)

### 2023-08-21 (Mon, Aug 21, 2023)
* feat: add DEBUG to available user inputs

### 2023-08-20 (Sun, Aug 20, 2023)
* fix: fetch all commits to avoid issues with missing commits

* Also, update number of commits for 'git log' to show in 'dump-env'

### 2023-08-20 (Sun, Aug 20, 2023)
* feat: add input box for default branch SHA for workflow_dispatch

### 2023-08-19 (Sat, Aug 19, 2023)
* refactor: 'fg()' to not output anything if there are no jobs

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: add a shellcheck disable directive and create symlink for go

### 2023-08-19 (Sat, Aug 19, 2023)
* fix: rename workflow and correct issues with some steps

### 2023-08-19 (Sat, Aug 19, 2023)
* docs: update some comments

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: utilize the 'pre-commit' GH Action

### 2023-08-19 (Sat, Aug 19, 2023)
* refactor: update how the 'pre-commit' job is run

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: miscellaneous changes and fixes to the workflow

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: add 'get-changed-files' job to make a list of changed files

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: add 'dump-env' job

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: add 'check-readme' job

* Signed-off-by: Fevrin <5051062+fevrin@users.noreply.github.com>

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: update pre-commit hook versions, add prettier, and fix hadolint

### 2023-08-19 (Sat, Aug 19, 2023)
* feat: add support for Makefile to generate the README

### 2023-08-16 (Wed, Aug 16, 2023)
* fix: add step to install golang due to nektos/act image having old 'go'

### 2023-08-16 (Wed, Aug 16, 2023)
* fix: gitconfig 'cl' alias

### 2023-08-10 (Thu, Aug 10, 2023)
* style: update 'make help' output style

### 2023-08-09 (Wed, Aug 09, 2023)
* feat: add 'help' command to Makefile

* This outputs the Makefile's commands and their descriptions in a
formatted table

### 2023-07-25 (Tue, Jul 25, 2023)
* fix: update 'fg' function again for zsh compatibility

* .shellrc.d/functions_general
* re-add escape in regex

### 2023-07-25 (Tue, Jul 25, 2023)
* fix: fixes for zsh compatibility/optimization and a 'gh' extension

* increase FUNCNEST to 45 since some autocompletion necessitated that

* .shellrc.d/aliases_general
* add 'poi' alias if the associated 'gh' extension is installed to
  compensate for undocumented behavior

* .shellrc.d/aliases_laptop
* make some aliases compatible with zsh by calling them via bash

### 2023-07-25 (Tue, Jul 25, 2023)
* feat: update functions for zsh support, IP accuracy, and starship format

* .config/starship.toml
* add repo format and style

* .shellrc.d/00_vars
* update '$SHELL' variable to be that of the current shell

* .shellrc.d/functions/_verify_reqs
* update logic to support zsh

* .shellrc.d/functions/aptupchange
* update logic to support zsh

* .shellrc.d/functions_net
* use a more accurate website for IP info

### 2023-07-13 (Thu, Jul 13, 2023)
* refactor: conditional docker completion

### 2023-07-13 (Thu, Jul 13, 2023)
* fix: absent '$HISTFILE' value

### 2023-07-13 (Thu, Jul 13, 2023)
* fix: zsh shell detection and file source ordering in .zshrc

### 2023-07-12 (Wed, Jul 12, 2023)
* docs: update CHANGELOG

## v2.9.0

### 2023-07-12 (Wed, Jul 12, 2023)
* feat(starship): change command timeout to be a snappy 50 milliseconds

### 2023-07-11 (Tue, Jul 11, 2023)
* feat: add 'glow' config

### 2023-07-11 (Tue, Jul 11, 2023)
* fix: regex in zsh' 'fg()' function

### 2023-07-10 (Mon, Jul 10, 2023)
* feat: add docker completion

### 2023-07-04 (Tue, Jul 04, 2023)
* refactor: update 'board-starship()' logic and add upcoming zsh config change

* 'cmd_hist_num_zsh' needs 1 or 2 subtracted from it to get the accurate history number, but the present command isn't cooperating when executed by
  starship

### 2023-07-06 (Thu, Jul 06, 2023)
* fix: update 'refresh-main-branch' to set the main branch if needed

### 2023-07-06 (Thu, Jul 06, 2023)
* fix: update 'refresh-main-branch' to set the main branch if needed

### 2023-07-04 (Tue, Jul 04, 2023)
* fix: add checks for existence of 'openvpn3' before running it and of a starship to board

### 2023-07-04 (Tue, Jul 04, 2023)
* feat: config updates, style changes, new functions

### 2023-07-04 (Tue, Jul 04, 2023)
* style: heading updates

### 2023-07-04 (Tue, Jul 04, 2023)
* feat: add several new k8s, starship, and zsh functions

### 2023-07-04 (Tue, Jul 04, 2023)
* feat: minor config updates and style changes

### 2023-07-03 (Mon, Jul 03, 2023)
* style: group 'setops' opts and clean up the comment area

### 2023-07-03 (Mon, Jul 03, 2023)
* feat: increase '$HISTSIZE' and have leading '>' in zsh behave like bash

* fix: 'asdf-vm/asdf' plugin URL and outdated references to '.bashrc.d'

### 2023-07-03 (Mon, Jul 03, 2023)
* refactor: move some Bash-specific env vars to .bashrc and add zsh CONFIG var

### 2023-07-02 (Sun, Jul 02, 2023)
* feat: update tmux's '$TERM' to use colors and add some aliases

* also fix '$GREEN' value

### 2023-07-02 (Sun, Jul 02, 2023)
* refactor: rearrange ~/.bashrc and add zsh plugin code

* also remove unneeded variables

### 2023-07-02 (Sun, Jul 02, 2023)
* fix: update remaining 'shellrc.d' references, add color vars

* also update a function to compare a variable instead of re-running a command run elsewhere

### 2023-07-02 (Sun, Jul 02, 2023)
* refactor: move around locations of some variables and functions

* also add a completions file and rename '$NO_COLOR' to '$END_COLOR'

### 2023-07-02 (Sun, Jul 02, 2023)
* refactor: rename '.bashrc.d/' to '.shellrc.d/'

### 2023-07-02 (Sun, Jul 02, 2023)
* refactor: config cleanup and clarification

### 2023-07-02 (Sun, Jul 02, 2023)
* refactor: move Bash History Control configuration to main .bashrc

* also add some comments and minor changes

### 2023-06-21 (Wed, Jun 21, 2023)
* feat: add commitlint pre-commit hook

### 2023-06-21 (Wed, Jun 21, 2023)
* fix: change back to use 'which' for some commands instead of 'has'

### 2023-06-19 (Mon, Jun 19, 2023)
* .zshrc: add a bunch of accumulated zshrc configs

### 2023-06-19 (Mon, Jun 19, 2023)
* refactor: various minor changes

#### .bashrc.d/00_vars
* update '$SYSTEMD_LESS' to match '$LESS'

#### .bashrc.d/functions/rsync-with-progress
* switch to using 'has()' instead of 'which'

#### .bashrc.d/functions_sec
* remove extraneous 'grep' command

#### .vimrc
* update URL for 'listchars' usage of "multiline"

### 2023-06-17 (Sat, Jun 17, 2023)
* feat(starship): Update the config to be more like the '$PROMPT_STRING'  

  This updates the starship config to be more like the '$PROMPT_STRING' in this repo.

### 2023-06-17 (Sat, Jun 17, 2023)
* style(starship): Modernize the git sections of the shell prompt

### 2023-06-17 (Sat, Jun 17, 2023)
* feat: Add and enable starship configuration

### 2023-06-17 (Sat, Jun 17, 2023)
* feat: add preliminary support for zsh

#### .bashrc
* add '$SHELL_TYPE' to reference the current shell's type (bash, zsh, etc.)

#### .bashrc.d/00_vars
* set the '$FUNCNEST' value based on the type of shell

#### .bashrc.d/functions/get-ips
* use an array for the network interfaces (it's better practice but also enables support for zsh)

### 2023-06-16 (Fri, Jun 16, 2023)
#### .bashrc.d/00_vars
* update '$SYSTEMD_LESS' to use a slightly different set of options than '$LESS'

#### .bashrc.d/base
* add a condition in which to attach to an existing tmux session

#### .vimrc
* update 'listchars' to enable built-in indent guides with spaces

### 2023-06-16 (Fri, Jun 16, 2023)
#### .bashrc
* utilize 'has()' instead of 'which'

#### .bashrc.d/base
* utilize 'has()' instead of 'which'

### 2023-06-13 (Tue, Jun 13, 2023)
#### .bashrc.d/functions/show-user-installed-pkgs
* add file

### 2023-06-12 (Mon, Jun 12, 2023)
#### .bashrc
* update indentation

#### .gvimrc
* update window lines/columns to be variables and use a formula

### 2023-05-10 (Wed, May 10, 2023)
#### .bashrc.d/00_vars
* update '$HTTP_REGEX' regex
* correct "LESS" setting for text search default ignore case

#### .bashrc.d/base
* update logic to take into account machines that do not offer "deep" sleep S3 setting

#### .bashrc.d/functions/fix-session-manager
* fix the session manager value only if needed

#### .bashrc.d/functions/rsync-with-progress
* add sudo support
* add "$PV_METHOD" flag
* retrieve file list only when using "pv"

#### .bashrc.d/remote/remote_base
* remove old "run-check()" function

#### .vimrc
* disable "cursorcolumn" setting by default, as it may slow vim down (as of v8.0.1599)

### 2023-03-20 (Mon, Mar 20, 2023)
#### .apple_keyboard_mod.rc
* simplify conditional statement

#### .bashrc
* enable resource-intensive variable only in small repos

#### .bashrc.d/base
* add a fix for slow startup in vim

#### .bashrc.d/functions/diff-home-files
* change behavior to not skip the '.bashrc' file

#### .bashrc.d/functions/rsync-with-progress
* change behavior to not use '--info=progress2' during dry runs

#### etc/sudoers
* add standard default settings

#### var/spool/cron/crontabs/username
* add configuration to keep password manager open during certain times

### 2023-01-31 (Tue, Jan 31, 2023)
#### .docker/config.json
* add a note to restart 'docker' when changing the config

#### .gitconfig
* add 'cl' alias to clone in a standard directory
* add "include" directive for additional config files

### 2023-01-26 (Thu, Jan 26, 2023)
#### .gitconfig
* update 'bclean' to default to 'gh' and its 'poi' extension

### 2023-01-26 (Thu, Jan 26, 2023)
#### .bashrc.d/functions_sec
* remove unnecessary uses of 'sudo'
* echo dangerous 'sgdisk' commands
* fix 'cryptsetup' commands

### 2023-01-26 (Thu, Jan 26, 2023)
#### .apple_keyboard_mod.rc
* update OS release conditional
* update dconf configuration

#### .bashrc.d/functions/rsync-with-progress
* add '--hard-links' as a default option
* skip processing the destination if it's a file
* use the "${LINK_DEST}" value only if it exists

#### .bashrc.d/functions_sec
* fix commands to what is confirmed to work

### 2022-12-22 (Thu, Dec 22, 2022)
#### .gitconfig.d/git-sync.sh
* fix 'stash pop' by using the index instead of a regex

### 2022-12-17 (Sat, Dec 17, 2022)
#### etc/systemd/system/powertop-restart.service
* fix service name reference

### 2022-12-08 (Thu, Dec 08, 2022)
#### etc/systemd/system/powertop-restart.service
* add

#### etc/systemd/system/powertop.service
* add

### 2022-12-07 (Wed, Dec 07, 2022)
#### .editorconfig
* add settings for multiple languages

#### .gitconfig
* update some formatting
* add `rf`, `save`, `ss`, and `undo` aliases

#### .tmux.conf
* update "status-interval" to be 5 seconds

#### .vimrc
* turn off visual bell
* add commented out "catppuccin" theme plugin

### 2022-11-30 (Wed, Nov 30, 2022)
#### .bashrc.d/functions/fix-session-manager
* new file

#### .gvimrc
* set window size since the default in GNOME is woefully small

### 2022-11-19 (Sat, Nov 19, 2022)
#### .bashrc.d/functions/grip
* fix file canonicalization

#### .bashrc.d/functions/yessh
* update arg processing to accept IP addresses for the hostname

### 2022-11-19 (Sat, Nov 19, 2022)
#### .bashrc
* change hostname color when ssh'ed in for easier identification

#### .vimrc
* add EasyAlign remaps

#### etc/hosts
* add missing comment character

### 2022-11-12 (Sat, Nov 12, 2022)
#### .apple_keyboard_mod.rc
* wrap updated `xmodmap` command in a conditional since it doesn't work in 20.04

#### .bashrc.d/functions/show-disk-space-usage
* use `sudo` so the command doesn't fail due to perms

#### .gitconfig
* remove extraneous config

#### .gitconfig.d/gitignore
* add more file patterns to ignore

#### .tmux.conf
* update status-right width limit

### 2022-11-11 (Fri, Nov 11, 2022)
#### .bashrc.d/functions/grip
* add to easily display Markdown files in a browser

#### .vimrc
* update plugins and plugin list format

#### etc/hosts
* add many more domains to blocklist

## v2.3.8

### 2022-10-26 (Wed, Oct 26, 2022)
#### .bashrc.d/functions/diff-home-files
* create any parent directories when copying new files to the repo

#### .gitconfig
* add `ca` alias for amending commits
* add `diff` configs
* add a section for git tips

#### .vim/after/plugin/ansi_esc.vim
* automatically colorize ANSI escape codes in files that may have them

#### .vimrc
* remove ANSI config to the separate file
* add mapping for EasyAlign plugin

## v2.3.7

### 2022-10-26 (Wed, Oct 26, 2022)
#### .apple_keyboard_mod.rc
* add new remapping technique that works with Ubuntu 22.04
* reformat whitespace

#### .bashrc
* reformat whitespace

#### .bashrc.d/00_vars
* disable `less` resetting search case sensitivity

#### .bashrc.d/base
* change from sourcing a file to executing it directly
* update some comments

#### .bashrc.d/functions/list-to-quoted-csv
* fix faulty logic

#### .gitconfig
* update message formatting
* add pager default for `git diff` so it shows special characters (tabs, in particular)
* minor update to `changelog` date format

#### .gitconfig.d/git-sync.sh
* format some subshells

#### .tmux.conf
* set width limit for `status-right` so the output isn't messed up if the weather script fails
* copy `SESSION_MANAGER` environment variable so vim startup isn't delayed (tmux issue [#1494](https://github.com/tmux/tmux/issues/1494))

#### .vimrc
* disable `relativenumber` in all cases
* alphabetize list of plugins

## v2.3.6

### 2022-10-24 (Mon, Oct 24 2022)
#### .bashrc.d/base
* update command to use with a new tmux session (either `htop` or `top`)

#### .bashrc.d/functions/compact_history
* update a comment about permissions

#### .gitconfig
* added "core" and "color" directives

#### .vimrc
* join a couple of lines
* fix the `curl` command used to install the plugin manager

## v2.3.5

### 2021-11-11 (Thu, Nov 11 2021)
#### .bashrc.d/aliases_laptop
* updated `cn` alias to use the new "speaker" target

#### .bashrc.d/functions/blueconnect
* added for easier management of a small number of bluetooth devices

#### .bashrc.d/functions/yessh
* fixed issues with running commands without getting to a shell prompt

### 2021-11-04 (Thu, Nov 04 2021)
#### .bashrc.d/base
* updated tmux initialization to begin with a `top` and blank window in an initial new session

#### .bashrc.d/functions_net
* updated `get-ip-location()` for better failure handling
* added `get-ip-city()`

#### .tmux.conf
* updated the status line to move the weather info to the left of the date/time

### 2021-11-03 (Wed, Nov 03 2021)
#### .bashrc.d/aliases_laptop
* added `cb` and `cn` for easier connecting to certain bluetooth devices

#### .bashrc.d/functions/get-broken-links
* added a comment noting a more mature tool for detecting bad links

#### .gitconfig
* updated `changelog` to be smarter with regards to which commits' notes it should retrieve
* added `df-alt`

#### .tmux.conf
* added some support for `dracula`'s weather scripts

### 2021-10-13 (Wed, Oct 13 2021)
#### .gitconfig
* updated `git bclean` for readability
* renamed `check-check` to `check-whitespace` for clarity
* added `git fork`
* updated `git ver` to require a version number

#### .gitconfig.d/git-sync.sh
* updated for clarity when recovering from a failure
* added code to push changes to the fork if a merge was done from the origin

#### Makefile
* fixed to better detect definitions within the content
* updated `check-defs` to additionally check for terms used but undefined

#### .bashrc.d/functions/tabular-to-csv
* updated to support `_get_stdin`

### 2021-09-17 (Fri, Sep 17 2021)
#### .githooks/pre-commit
* added

#### Makefile
* added `make dev`, `make git-hooks`, and `make check-defs`

### 2021-09-11 (Sat, Sep 11 2021)
#### .bashrc.d/functions/diff-home-files
* added file exceptions
* fixed variable scoping in completions function

#### .bashrc.d/functions_general
* improved function interpretation confirmation code

#### .bashrc.d/remote/remote_base
* improved portability of conditional `~/.bashrc` sourcing

#### .gitconfig
* improved robustness of `bclean`, `df`, and `dff`
* added `list-tracked-files`

#### .gitconfig.d/git-sync.sh
* added support for pulling upstream changes and merging those into a fork

### 2021-08-21 (Sat, Aug 21 2021)
#### .bashrc.d/functions/diff-home-files
* updated bash completion to show filenames with the `file` subcommand
* updated `file` subcommand to support multiple files

### 2021-08-20 (Fri, Aug 20 2021)
#### .apple_keyboard_mod.rc
* added conditional to run old keybinding commands if the new method doesn't work

#### .bashrc.d/functions/compact_history
* added basic bash completion

#### .bashrc.d/functions/diff-home-files
* added basic bash completion

#### .bashrc.d/functions/show-disk-space-usage
* added

#### .bashrc.d/functions_general
* updated code for readability
* added code to unset a function first (to ensure there isn't weirdness around the version that's available)

#### .gitconfig
* added verbosity when deleting the current branch

### 2021-08-12 (Thu, Aug 12 2021)
#### .gitconfig
* rearranged `changelog` for readability
* added caching behavior for `get-main-branch`

#### .bashrc.d/functions/sort-by-line-length
* corrected sorting behavior


## v2.3.0

### Wed Aug 4 21:46:28 2021 -0400
#### .apple_keyboard_mod.rc
* updated to utlize xkb rules instead of xmodmap

#### .bashrc
* added file type validation prior to sourcing

#### .bashrc.d/base
* updated to automatically set deep sleep

#### .bashrc.d/functions/_verify_reqs
* updated to output failure messages for dependencies

#### .bashrc.d/functions/diff-home-files
* updated to permit diffing a specified file

#### .bashrc.d/functions/get-volume-percentage
* added

#### .gitconfig
* updated aliases for readability
* reduced duplication of code

#### .vimrc
* added conditional block to source pathogen only when the associated file exists

### Sat Jul 10 00:02:28 2021 -0400
#### .gitconfig
* added some new aliases

#### .gitconfig.d/git-sync.sh
* fixed a bug when changing directory

#### Makefile
* added

### Fri Jun 11 23:08:23 2021 -0400
#### .gitconfig
* updated the `dff` alias's regex

#### .gitconfig.d/git-sync.sh
* rearranged a couple of lines

### Fri Jun 11 15:33:02 2021 -0400
#### .gitconfig
* replaced duplicated code to reference new git aliases

### Tue Jun 8 00:56:14 2021 -0400
#### .bashrc.d/base
* switched back to `tee` from `sponge`
* added `mtr` to HISTIGNORE

#### .bashrc.d/functions_sec
* added `ssh_key_is_encrypted()`

#### .bashrc.d/remote/remote_base
* fixed source command to ensure it isn't going to recursively source

#### .gitconfig
* updated various aliases to support `main` branch
* added aliases to detect the main branch and main remote names

#### .gitconfig.d/git-sync.sh
* added support for `main` branch name
* added some checks and verbosity

#### etc/hosts
* added more domains to blacklist

### Mon Apr 12 15:21:28 2021 -0400
#### .gitconfig
* updated aliases to be more concise

#### .gitconfig.d/git-sync.sh
* stash any staged files and re-add them after rebasing

### Mon Apr 12 14:23:34 2021 -0400
#### .bashrc.d/functions/seek-broken-links -> .bashrc.d/functions/get-broken-links
* renamed and updated to include any errors messages

#### .gitconfig
* updated some aliases

#### .gitconfig.d/git-sync.sh
* updated a git command for getting the current branch

### Tue Apr 6 02:39:18 2021 -0400
#### .gitconfig
* added `dffs` and `diff-with-master` aliases

#### .gitconfig.d/git-sync.sh
* removed old code in favor of more concise version

### Tue Mar 23 12:28:06 2021 -0400
#### .gitconfig
* added `dff` alias to take over the previous `df` behavior
* `df` now diffs by character

#### .tmux.conf
* added a missing escape of a backslash

### Tue Mar 9 16:31:53 2021 -0500
#### .bashrc.d/00_vars
* updated regex vars

#### .bashrc.d/functions/seek-broken-links
* updated to support parallel for faster processing

#### .gitconfig
* improved diff and log aliases

#### .gitconfig.d/git-sync.sh
* added output when aborting a git rebase

### Thu Feb 4 17:19:28 2021 -0500
#### .bashrc.d/functions/diff-home-files
* removed heredoc that's incompatible with Bash 5

#### .bashrc.d/functions_general
* improved sanity function checks before sourcing and exporting

#### .gitconfig
* fixed path specification to use `~` instead of `$HOME`
* updated `df` and `dfs` to diff by character

#### .gitconfig.d/gitattributes
* commented out config, which led to weird behavior for some repos

#### .gitconfig.d/gitignore
* added `.idea` to dismiss PyCharm config directories and files

#### etc/sudoers.d/edit-history
* added

### Mon Nov 2 22:33:46 2020 -0500
#### .bashrc.d/01_vars
* added export commands

#### .bashrc.d/base
* updated some comments
* updated logic for determining when to start a new tmux session
* added ability to specifically include or exclude aliases added to  HISTIGNORE

#### .bashrc.d/functions/_print_var_vals
* updated FUNCNEST value

#### .bashrc.d/functions/diff-home-files
* added _help()
* added arguments to alter execution behavior

#### .bashrc.d/functions/yessh
* updated a comment
* updated formatting of a command for readability

#### .gitconfig
* updated some variable values

#### .tmux.conf
* updated key bindings

#### .vimrc
* added a config for ssh config files

#### etc/hosts:
* added

#### etc/sudoers.d/laptop-sleep:
* added

### Sat Jun 13 02:31:56 2020 -0400
#### .bashrc.d/functions/convert-timestamp-to-date
* added timestamp validation for the quick method

### Sat Jun 13 02:06:32 2020 -0400
#### .bashrc.d/functions/convert-timestamp-to-date
* added a more thorough and accurate timestamp conversion strategy, which is the new default

### Sat Jun 13 02:04:47 2020 -0400
#### .bashrc.d/base
* updated the trailing character appended to aliases when generating HISTIGNORE
* added a minimum alias name length requirement for adding to HISTIGNORE

#### .bashrc.d/functions/_get_stdin
* added

#### .bashrc.d/functions/convert-timestamp-to-date
* updated to support the new _get_stdin() helper function

#### .bashrc.d/functions/list-to-quoted-csv
* updated to support the new _get_stdin() helper function

#### .bashrc.d/functions/sort-by-line-length
* added

### Tue Jun 9 20:02:13 2020 -0400
#### .bashrc.d/base
* updated HISTIGNORE generation for greater readability

#### .bashrc.d/functions/clipit-copy
* added the option to open the file with gvim and made that the default
* rearranged some comments to ensure the function is sourced

#### .bashrc.d/functions/copy-skey
* rearranged some comments to ensure the function is sourced

#### .bashrc.d/functions/get-vb-ip
* rearranged some comments to ensure the function is sourced

#### .bashrc.d/functions/img2pdf
* rearranged some comments to ensure the function is sourced

#### .bashrc.d/functions/showpkg
* rearranged some comments to ensure the function is sourced

#### .gitignore_global -> .gitconfig.d/gitignore
* renamed

#### .gitconfig.d/gitattributes
* added

### Thu Jun 4 15:31:15 2020 -0400
#### .bashrc.d/aliases_general
* commented out an old alias for now to avoid issues with it overriding the same-named command
* changed double quotes to single quotes to standardize on that
* corrected a regex in `tsm` to properly detect when tmux is in use
* added `eh` as an alias of `edit-history`

#### .bashrc.d/base
* updated command for setting deep sleep of the OS and added comment for executing that without needing a password

#### .bashrc.d/functions/compact_history
* added a comment for executing this function without needing a password

#### .gitconfig
* added "excludesfile" and "attributesfile" values
* added code to run `git add -u` to stage tracked files that have changed prior to running `git-sync.sh`
* updated `pushall` to push to multiple repos in parallel

#### .gitconfig.d/git-sync.sh
* added logic to attempt rebasing the branch only if master has been updated

#### .vim/after/ftplugin/gitcommit.vim
* added

#### .vimrc
* wrapped lines longer than 125 characters to respect the textwidth limit
* added a comment about vim needing the textwidth value for gitcommit files to be in a separate file to work
* added file-specific options
* added config for editing gpg-encrypted files

### Sat May 9 02:55:57 2020 -0400
#### .bashrc.d/aliases_general
* added example sudoers lines

#### .bashrc.d/functions/_find_unscoped_vars
* added more robust code for finding and presenting improperly scoped variables across multiple files

#### .bashrc.d/functions/archive-emails
* added more robust code for accurately calculating time frames for which to show emails

#### .bashrc.d/functions/clipit-copy
* updated to properly scope variables

#### .bashrc.d/functions/convert-timestamp-to-date
* updated to properly scope variables

#### .bashrc.d/functions/copy-skey
* updated to properly scope variables

#### .gitconfig
* updated the `ci` alias to correctly handle arguments

#### .gitconfig.d/git-sync.sh
* updated to provide more control around stashing to be more compatible with being run via cronjob vs. manually

#### .tmux.conf
* added a comment noting the unfortunate behavior in which tmux reads and executes its config file in full before creating a session leading to errors

#### etc/logrotate.d/chrome-history
* updated rotation count to be 520 weeks (~10 years) to ensure the history doesn't destroy old files too often

#### etc/sudoers
* added a comment with example lines for enabling commands to be run without prompting for the password

#### var/spool/cron/crontabs/username
* updated to include examples of cronjobs for starting and stopping a service

### Sat May 9 02:51:43 2020 -0400
#### .gitconfig.d/git-sync.sh
* added

#### etc/logrotate.d/chrome-history
* added

#### .bashrc.d/functions/diff-home-files
* added `etc/logrotate.d/chrome-history` to list of files to skip

#### .gitconfig
* added `bclean`

#### .vimrc
* updated format of headings for various config settings

### Wed Apr 15 02:57:24 2020 -0400
#### .bashrc.d/functions/diff-home-files
* enabled skipping files

#### .bashrc.d/functions/time-between-now-and
* updated logic to properly calculate days, hours, minutes, and seconds

#### .bashrc.d/functions/yessh
* fixed an issue when ssh'ing into hosts that don't have `bzip2` installed by default, like CentOS

#### .bashrc.d/remote/remote_base
* improved logic in run-check() for running check commands

#### .gitconfig
* updated `pushall` and `pushallf` aliases to ask before pushing to `master`
* fixed an issue with `changelog` alias regarding formatting of lines following date lines

#### .tmux.conf
* added commented out code that may fix the issue with tmux tabs not automatically getting renamed

#### .vimrc
* set formatting options explicitly so they're not as easily overridden

### Wed Apr 8 21:27:49 2020 -0400
#### .bashrc.d/remote/remote_base
* added code to enable bash completion since that's not always enabled

#### .gitconfig
* updated commands for `git ci` alias to better handle some cases

### Wed Apr 8 14:51:48 2020 -0400
#### .bashrc.d/00_vars
* added DOMAIN_REGEX
* updated HTTP_REGEX and EMAIL_REGEX

#### .bashrc.d/functions_sec
* get_ssl_cert(): added domain validation and further host name
processing

#### .bashrc.d/remote/remote_base
* run-check(): added for running Nagios checks locally on a host
* added logic to not run run-parts if it doesn't exist

#### .gitconfig
* updated 'git ci' alias to attempt to rebase on master before
committing
* added 'who' alias for displaying the repo's contributors
* updated pull.ff to 'only' so pulls fail if they can't fast-forward


## v2.2.5

### Wed Feb 26 13:58:26 2020 -0500
#### .bashrc.d/functions/_find_unscoped_vars
* added

#### .bashrc.d/functions/archive-last-week-emails -> .bashrc.d/functions/archive-emails
* renamed

#### .bashrc.d/functions/pushd
* fixed scope of variables

#### .bashrc.d/functions/time-between-now-and
* fixed scope of variables

### Tue Feb 25 23:59:03 2020 -0500
#### .bashrc.d/functions/archive-last-week-emails
* added

#### .bashrc.d/functions/compact_history
* updated to remove all but the last occurrence (rather than all but the first occurrence)
* added a return statement where one should have been

#### .bashrc.d/functions/diff-home-files
* added code to suggest files to include in the repo

#### .bashrc.d/functions/time-between-now-and
* corrected variable scopes

### Wed Feb 12 14:48:10 2020 -0500
#### .bashrc.d/aliases_laptop
* added shell interpreter line

#### .bashrc.d/base
* updated HISTIGNORE to exclude all git aliases

#### .bashrc.d/functions/_print_var_vals
* added FUNCNEST to protect against infinite recursion

#### .bashrc.d/functions/_verify_reqs
* updated documentation
* updated version comparison logic to try `-v` and `-V` flags to obtain version

#### .bashrc.d/functions_general
* removed duplicated code

#### .bashrc.d/functions_net
* added shell interpreter lien

#### .bashrc.d/functions_sec
* added shell interpreter lien

#### .gitconfig
* added `pushallf`
* added `changelog`

#### .tmux.conf
* updated spelling of "center" to "centre" to make tmux happy

### Thu Jan 16 20:32:08 2020 -0500
#### .bashrc.d/functions/convert-timestamp-to-date
* removed mostly duplicate code

### Thu Jan 16 20:12:19 2020 -0500
#### .bashrc.d/functions/convert-timestamp-to-date
* added

#### .gitconfig
* changed `git pushall` to run in a new shell so it can accept additional flags

#### .tmux.conf
* increased history-limit from 10000 to 50000

### Fri Dec 27 21:51:23 2019 -0500
#### .gitconfig
* added some comments with possible config to include once filled out

#### .tmux.conf
* increased scrollback limit to 10000

### Wed Dec 25 22:24:33 2019 -0500
#### .bashrc.d/functions/colorize
* converted to use `tput` to output termcap codes

#### .gitconfig
* added `pushall` and `git fet` aliases

#### .tmux.conf
* fixed status line justification
* added some vi copy mode key bindings


## v2.2.0

### Tue Dec 17 22:46:57 2019 -0500
#### .bashrc.d/aliases_general
* added `tsm` for displaying the tmate session values if in a tmate session

#### .bashrc.d/base
* switched to default to using tmux instead of GNU screen

#### .tmux.conf
* added (including rebinding to GNU screen keys)

#### .vimrc
* added vim-go and elm-vim configurations

### Mon Dec 9 15:41:47 2019 -0500
#### .bashrc.d/00_vars
* fixed HTTP_REGEX to account for '+' characters in URLs

#### .bashrc.d/functions/seek-broken-links
* fixed ability to specify args in different orders depending on which ones will be processed by getopts

#### .bashrc.d/functions_general
* added some function validation/filtering to be extra careful about which function files are exported

### Fri Oct 11 18:43:46 2019 -0400
#### .vimrc
* added some netrw file explorer settings

### Fri Sep 27 17:10:08 2019 -0400
#### .bashrc.d/functions/pushd
* added default verbosity
* changed "dir_list" to be generated just once

#### .bashrc.d/functions/sql-tab-to-jira-tab
* improved order of commands

#### .gitignore_global
* adding *.pem files


## v2.1.6
### Tue, Jul 9, 2019

   .bashrc.d/functions/yessh  
  \* commenting the new code that permits running a command without logging in

   .gvimrc  
  \+ adding config to undo some changes mswin.vim makes


## v2.1.5
### Sat, Jun 22, 2019

   .bashrc.d/functions_general  
  \* split out all functions to individual files in the `functions` subdirectory for easier maintenance  
  \* updated to support the new split out function files  
  \* fleshed out comments on functions' purposes and usage in the individual files

   .bashrc.d/functions/compact_history  
  \* regexes with start and end of line anchors will have those stripped since those won't work in the context of the final regex  
  \* updated the regex removal line to account for leading and trailing whitespace

   .bashrc.d/functions/yessh  
  \* you can now run functions sent to the host without actually logging in  
  \* updated to not bomb out if ~/.bashrc.d/remote/* doesn't exist

   .bashrc.d/functions/_print_var_vals  
  \* you can now specify a verbosity level  
  \* fixed so it doesn't bomb out if given an unset or non-variable

   .bashrc.d/functions/get-ips  
  \* just IPs are printed out when given interfaces

   .bashrc.d/functions/_verify_reqs  
  \* fixed a bug in which failures weren't correctly listed

   .bashrc.d/functions/diff-home-files  
  \* updated to build a more complete list of files to compare

   .bashrc.d/functions/verbose  
  \- removed teeing to a file

   .bashrc.d/remote/remote_base  
  \+ added a note regarding the purpose of this file

   .docker/config.json  
  \+ added

   .vimrc  
  \+ added some config directives

   CONTRIBUTING.md  
  \+ added

   .bashrc.d/00_vars  
  \* updated variable names to be uppercase for better global scope indication

   Fixed variables not properly scoped in these files:  
   .bashrc.d/functions/_verify_reqs  
   .bashrc.d/functions/aptupchange  
   .bashrc.d/functions/colorize  
   .bashrc.d/functions/copy-file-by-line  
   .bashrc.d/functions/seek-broken-links  
   .bashrc.d/functions_dns  
   .bashrc.d/functions/diff-home-files


## v2.1.0
### Fri, Jun 14, 2019

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


## v2.0.9
### Wed, Jun 12, 2019

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


## v2.0.7
### Mon, Jun 10, 2019

   .bashrc.d/functions  
  \* added exception so pushd() is not exported when other functions are  
     yessh():  
    \+ added support for verbose()  
    \* updated to permit simply running a command instead of logging into the command line  
     verbose():  
    \+ added support for brief verbosity level descriptions instead of just numbers

   .my.cnf  
  \+ added skip-reconnect to avoid potentially disastrous queries


## v2.0.6
### Tue, Jun 04, 2019

   .bashrc.d/functions  
     pushd():  
    \* simplified duplicate directory check  
    \+ added another conditional to short circuit exit if the user provides an invalid directory  
     yessh():  
    \+ added functionality to just copy the config over to the target server as a temporary file if it's of a certain size (as was done before the
       base64 technique, though we now use base64 for it, too)  
    \* updated config transfer to incorporate bzip2 compression to further reduce network bandwidth usage  
  \+ sql-tab-to-jira-tab(): added  
  \+ generate_luks_keyfile(): moved from lib_sec  
  \+ added code to automatically export all functions within the file  


## v2.0.5
### Thu May 30 22:40:55 2019 -0400

   .bashrc.d/functions  
  \* pushd(): updated to prevent duplicate directories from getting added to the dir stack


## v2.0.4
### Wed May 29 19:10:03 2019 -0400

   .bashrc.d/functions  
  \+ compact_history(): added


## v2.0.3
### Mon May 27 00:58:28 2019 -0400

   .bashrc  
  \* updated HISTIGNORE for efficiency  
  \- removed unneeded bits

   .bashrc.d/functions  
  \* moved aptupchange() and copy-skey() from .bashrc.d/aliases to here

   .bashrc.d/aliases  
  \- removed unneeded aliases


## v2.0.2
### Sat May 25 23:31:06 2019 -0400

   .bashrc.d/functions  
  \* get-ips(): updated to output contents only when an IP is found


## v2.0.1
### Tue May 21 19:41:57 2019 -0400

   .bashrc  
  \+ added the $GOBIN variable

   .bashrc.d/functions  
  \* yessh(): updated to copy over all files in ~/.bashrc.d/remote/\*  
  \+ verbose(): added

   .bashrc.d/remote  
  \* moved to ~/.bashrc.d/remote/remote_base

   .screenrc_main  
  \* updated the default directory for a couple of screens


## v2.0.0
### Wed May 15 20:56:26 2019 -0400

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


## v1.6.7
### Mon May 13 20:56:57 2019 -0400

   .bashrc  
  \* reworked creation of PATH and GOPATH


## v1.6.5
### Thu May 9 20:52:20 2019 -0400

   .bash_aliases  
  \* $ip_regex: updated to include "0" as a valid octet  
  \+ count-ips-from-tcpdump() : added  
  \* get-ips(): updated for more verbose output

   .bashrc_common  
  \* expand the conditions for which the PS1 string is updated


## v1.6.4
### Wed Apr 24 18:29:14 2019 -0400

   .bash_aliases  
  \+ get-ips: added alias for retrieving assigned IPs  
  \* yessh(): updated to include additional usage information

   .bashrc  
  \- removed HISTFILESIZE assignment since that seems to bomb out Bash in some cases; it seems as of bash version 4.4.19(1)-release, having the
     history file larger than this size causes a segfault


## v1.6.3
### Sat Apr 13 01:35:49 2019 -0400

   .bash_aliases  
  \+ added $ip_regex  
  \+ copy-file-by-line(): added

   .bashrc_common  
  \+ added commands to output last login time


## v1.6.2
### Thu Apr 11 21:19:04 2019 -0400

   .bash_aliases  
  \+ added calculate-free-mem and calculate-used-mem aliases  
  \+ list-to-quoted-csv(): added

   .bashrc_common  
  \* fixed the regex for determining if a hostname needs to include the region (in case it doesn't already)

   .gitconfig  
  \+ added config to by default push to 'origin'  
  \+ added config to by default not be permitted to push directly to the master branch


## v1.6.1
### Wed Apr 3 22:06:48 2019 -0400

   .bash_aliases  
  \* updated clipit-copy() to recommend a better alternative  
  \+ added tabular-to-csv() for converting standard MySQL tabular output to CSV


## v1.6.0
### Wed Mar 27 17:44:28 2019 -0400

   .bash_aliases  
  \* updated clipit-copy() to actually copy content to the clipboard  
  \* updated yessh() to negate the need for a temporary file (an issue when the target host's disk is full)

   .bashrc_common  
  \* make terminal color setting commands more logical and readable  
  \* make MOTD printing more robust

   .gvimrc  
  \* updated config to include standard Ctrl-C and Ctrl-V keybindings for easier copy and paste


## v1.5.9
### Fri Mar 8 00:46:18 2019 -0500

   .bash_aliases  
  \* updated clipit-copy() to work properly

   .bashrc_common  
  \* updated PS1 to always have certain colors


## v.1.5.8
### Wed Mar 6 23:36:26 2019 -0500

   .bash_aliases  
  \* changed the find-broken-links alias to be seek-broken-links() for more flexibility (Bash doesn't like a function starting with the name of a
     command when it's separated by dashes instead of underscores, it seems)


## v.1.5.7
### Wed Mar 6 00:14:44 2019 -0500
   .bash_aliases  
  \+ added clipit-copy() to deal with the limited N_TTY_BUF_SIZE value  
  \* updated yessh() to handle ssh options better

   .bashrc_common  
  \* prepended a newline to PS1

   .gitignore_global  
  \+ added since this apparently wasn't being saved before


## v.1.5.6
### Mon Mar 4 01:22:26 2019 -0500

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


## v1.5.4
### Mon Feb 18 18:42:57 2019 -0500

   .bash_aliases  
  \* addressed Mac OS X compatibility

   .bashrc  
  \* addressed Mac OS X compatibility

   .bashrc_common  
  \* addressed Mac OS X compatibility


## v1.5.3
### Fri Feb 15 01:50:11 2019 -0500

   .bash_aliases  
  \* fixed yessh() to better handle cases when the port or username is supplied (rather than using the defaults)


## v1.5.2
### Tue Feb 12 23:14:59 2019 -0500

   .bashrc_common  
  \+ added vimrc config


## v1.5.1
### Mon Feb 11 18:35:10 2019 -0500

   .bash_aliases  
  \* fixed a filename

   .bashrc_common  
  \* corrected stderr redirection  
  \* updated an alias to always use color output


## v1.5.0
### Sun Feb 10 19:11:16 2019 -0500

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


## v1.4.8
### Sun Jan 13 21:13:37 2019 -0500

   .bash_aliases  
  \* updated `diff-home-files` to give uesr the chance to create a missing file


## v1.4.7
### Tue Jun 19 21:10:18 2018 -0400

   .bash_aliases  
  \+ added `fix-broken-links` and `make-broken-link-table`


## v1.4.6
### Thu May 10 21:13:09 2018 -0400

   .bash_aliases  
  \* updated `apt-history`


## v1.4.5
### Tue May 1 22:01:35 2018 -0400

   .bashrc  
  \* updated HISTIGNORE

   .bash_aliases  
  \+ added img2pdf()


## v1.4.4
### Tue Apr 24 22:07:59 2018 -0400

   .screenrc_main  
  \* changed main directory


## v1.4.3
### Wed Apr 18 16:35:57 2018 -0400

   .macrc  
  \+ added `edit-history` alias  
  \+ added code to prevent Finder from showing up in the app switcher


## v1.4.2
### Thu Sep 7 20:01:26 2017 -0400

   .macrc  
  \+ added code to set banner notification timeout to 3s


## v1.4.1  
### Wed Jul 19 19:31:19 2017 -0400

   .bash_aliases  
  \* updated the conditional in `diff-home-files` for accuracy


## v1.4.0
### Tue Jul 4 22:51:25 2017 -0400

   .bashrc  
  \+ added timestamp to PS1 prompt string


## v1.3.9
### Thu Jun 1 18:06:37 2017 -0400

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


## v1.3.8
### Tue May 30 17:07:37 2017 -0400

   .bashrc  
  \* some changes to support Ubuntu 16.10 now starting at SHLVL 2  
  \* corrected logic for when to display .bash_history size message

   .bash_aliases  
  \+ added `edit-history` to automate unsetting and resetting append mode of .bash_history when editing it  
  \+ added `apt-history` to display apt history in a more readable format


## v1.3.7
### Sun Oct 30 22:10:00 2016 -0400

   .apple_keyboard_mod.rc  
  \* re-arranged logic to work better on all hardware

   .bashrc  
  \* updated check for existing screen sessions for compatibility  
  \+ added a check for .bash_history's append-only mode status  
  \+ added a check for .bash_history's size, as it can grow large in append-only mode

   .screenrc_main  
  \+ appended directories with forward slashes


## v1.3.6
### Tue Oct 13 12:56:44 2015 -0400

   .gitconfig  
   \+ added 'dfs' and 'diffs' aliases for diffing staged files

   .bashrc  
   \+ added sourcing of the git completion file on Mac OS X  
   \* updated the screenrc file path to work with Mac OS X


## v1.3.5
### Tue Sep 22 21:03:44 2015 -0400

   .toprc  
   \* updated to include full commands and arguments

   .bash_aliases  
   \* updated pushd() to better handle day-to-day usage  
   \* updated dirs alias to be simpler and correspond with the updated pushd()  
   \+ added popd(), similar to pushd()


## v1.3.4
### Mon Sep 21 23:02:37 2015 -0400

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


## v1.3.3
### Sun Sep 13 18:41:53 2015 -0400

   .gitignore_global  
   \+ added

   .gitconfig  
   \+ added gitignore file setting

## v1.3.2
### Tue Aug 4 15:12:19 2015 -0400

   .bashrc  
   \* updated to source lib_all instead of just lib_main

   .editrc  
   \+ added (mainly to ensure MySQL uses vi keybindings)


## v1.3.1
### Wed Jul 29 03:21:47 2015 -0400

   .bashrc  
   \+ added work aliases in ~/.bash_work_aliases

   .macrc  
   \+ added an alias for md5sum
