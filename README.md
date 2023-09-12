# Home files

- [Purpose](#purpose)
- [Requirements](#requirements)
- [Usage](#usage)
  - [Makefile](#makefile)
- [Linting](#linting)
  - [GitHub Actions](#github-actions)
  - [Local `pre-commit` linting](#local-pre-commit-linting)

## Purpose

These files set up functions that offer ways to automate some repetitive work tasks and offer simple interfaces to more complex commands.

## Requirements

* Bash version 4.4.19 or higher

If used within OSX/macOS, you may have to install equivalent Linux equivalents of core utilities (such as via Homebrew) and alias them to be callable
via their typical name (rather than what Homebrew may install, like `ggrep` instead of just `grep`).

## Usage

### Makefile

The following the available Makefile commands:

```editorconfig
$ make help

[Aliases]
dev              runs 'git-hooks'

[Automatic]
.git/hooks/%     creates symlinks for all git hooks from '.githooks' to '.git/hooks'

[Generators]
generate-docs    Regenerates Markdown files (including ToC and 'make help' output)
git              generates "${HOME}/.gitconfig" file using 'includes' directives
ssh              generates "${HOME}/.ssh/config" file using 'includes' directives

[Miscellaneous]
check-defs       checks all Markdown files for unused definitions
check-md-links   checks all Markdown files for unused definitions
help             returns this Makefile's commands and their descriptions in a formatted table
```

## Linting

There is a GitHub Actions workflow in `.github/workflows` for linting the files in this repo. It utilizes multiple tools, such as MegaLinter,
`pre-commit`, as well as some custom jobs to best ensure the files are standardized and hopefully bug-free.

There is also a `pre-commit` make target that can be used to run a subset of MegaLinter's linting locally.

### GitHub Actions

The configuration files for most of the tools MegaLinter uses are located in `ci/`. You can make adjustments there, as needed.

If the repo on GitHub is configured with GitHub Actions enabled, simply uploading the workflow file as part of a `git push` to a PR should kick off the
workflow.

Alternatively, the workflow can be run locally using `nektos/act`.

To run using `nektos/act`, follow these steps:
1. download, install, and configure (if necessary):
   1. [`gh`][install `gh`]
   1. [`nektos/act`][install `nektos/act`]
   1. [docker][install docker]
1. add the following to `~/.actrc`:

       -P ubuntu-latest=catthehacker/ubuntu:act-22.04

Once set up, you can run a command like this to execute all relevant jobs in the workflow:

    gh act --rm -W .github/workflows/pre-commit.yml

If you didn't install `nektos/act` as a `gh` extension, you should still be able to use a similar command adjusted based on your installation method.

To run a specific job:

    gh act --rm -j lint -W .github/workflows/pre-commit.yml

### Local `pre-commit` linting

If `pip` is installed, `make pre-commit` will run all `pre-commit` hooks on all changed files. Note that the `pre-commit` linting is a subset of what 

When working through large amounts of linting changes, it can be helpful to use a split pane in tmux (or a separate terminal window) so you can make
changes in one pane/window while running a linter command in the other.

If you have `inotifywait` installed, you can run the following command from the repo root in one pane/window to effectively get a live update on
`editorconfig-checker` errors as you make changes in another pane/window:

```bash
while inotifywait --exclude '(\.swp$|^\./\.git/)' --format '%f:%e%0' -e modify -r .; do pipenv run pre-commit run --color=always ec -a; done
```

You can modify the command to run any or all of the other `pre-commit` hooks, as needed.


[install `gh`]: https://github.com/cli/cli#installation
[install `nektos/act`]: https://github.com/nektos/act#installation
[install docker]: https://docs.docker.com/get-docker/
