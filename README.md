# Purpose

These files set up functions that offer ways to automate some repetitive work tasks and offer simple interfaces to more complex commands.

# Requirements

* Bash version 4.4.19 or higher

If used within OSX/macOS, you may have to install equivalent Linux equivalents of core utilities (such as via Homebrew) and alias them to be callable via their typical name (rather than what Homebrew may install, like `ggrep` instead of just `grep`).

# Usage

## Makefile

The following the available Makefile commands:
```
$ make help

[Aliases]
dev              runs 'git-hooks'

[Automatic]
.git/hooks/%     creates symlinks for all git hooks from '.githooks' to '.git/hooks'

[Generators]
git              generates "${HOME}/.gitconfig" file using 'includes' directives
readme           Regenerates README.md (including table of contents and Makefile help)
ssh              generates "${HOME}/.ssh/config" file using 'includes' directives

[Miscellaneous]
check-defs       checks all Markdown files for unused definitions
help             returns this Makefile's commands and their descriptions in a formatted table
```