# Contribution Guidelines

Below are the contribution guidelines we should follow. In general, we should make use of the [GitHub
Flow](https://guides.github.com/introduction/flow/) for contributions.

Contributions to updating these guidelines are welcome and encouraged!

## Definitions

**Minor changes:**
* Grammatical in nature
* Whitespace (when it doesn't affect code behavior)

**Major changes:**
* Anything that's not minor
* Expected program inputs are changed
* Program outputs are changed
* Program behavior is changed
* Program requirements are changed

## Coding Rules

* Adhere to best practices in whichever language you use
* Require the user install as little unique software as possible (ideally only software generally available in standard OS repositories, not fancy
  PPAs, specific vendors' sites, etc.)
* Include clear installation and usage instructions in a README.md, help output, etc.
* Test your changes

## Submission Rules

**Always:**
* Make changes in a feature branch that's named in the form `<username>/<jira-id>-<brief-description>`; example:

      jdoe/devtools-1234-defusing-fork-bomb

* Open a PR prior to merging to master
* Provide clear context in the PR around the changes, including the following:
   * purpose
   * expectations
   * links to conversations about them
   * etc.

  If needed, create and reference in the PR a Jira and/or GHE issue for further context

* Obtain at least one other teammate's +1 prior to merging
* Update relevant bits of documentation affected by your code changes (including outside the repo)
* Delete the feature branch in GHE once it's been merged into master
* Advertise changes in tool behavior, outputs, expected inputs, or other requirements to the rest of the team

**Never:**
* Make changes in master directly
* Merge into master without first obtaining at least one teammate's +1
* Revert someone else's change without first consulting with another teammate (unless it's a clearly breaking change)

Exceptions to any of these rules can be made with approval from the rest of the team.
