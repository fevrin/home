MAKEFILE := $(lastword $(MAKEFILE_LIST))
MAKE_COMMAND := $(MAKE) -C $(abspath $(dir $(MAKEFILE))) -f $(abspath $(MAKEFILE))
CHANGED_FILES ?= $(shell git diff --name-only origin/HEAD)
REPO_ROOT ?= $(shell git rev-parse --show-toplevel)

.PHONY: ssh git
# from <https://stackoverflow.com/questions/2131213/can-you-make-valid-makefiles-without-tab-characters/60363121#60363121>
.RECIPEPREFIX := $(.RECIPEPREFIX) # switch to using spaces instead of tabs for recipe separators

CONFIG_FILE := "config.new.$$$$"
ssh: ## Generators: generates "${HOME}/.ssh/config" file using 'includes' directives
ifeq ($(notdir $(CURDIR)), .ssh)
   $(info running $@)

   $(eval TEMPLATE := "config.template")
   $(eval DIR := "config.d")

   @if [ -d $(DIR) ]; then \
      cp -ai $(TEMPLATE) $(CONFIG_FILE); \
      $(info going through all Include lines and replace them with the file contents) \
      for line in $(shell grep -n Include $(TEMPLATE) | sed -re 's;Include ;;' | sort -r); do \
         lineno=$${line%%:*}; \
         file=$${line##*:}; \
         #echo "lineno = '$$lineno'; file = '$$file'"; \
         if [ -f "$$file" ]; then \
            sed -i -re "$${lineno}r $$file" $(CONFIG_FILE); \
         fi; \
         sed -i -e "$${lineno}d" $(CONFIG_FILE); \
      done; \
      $(info ) \
      $(info config file created here:) \
      $(realpath $(info $(CONFIG_FILE))) \
   else \
      echo $(DIR) "doesn't exist!"; \
   fi
else
   @# Makefile path determination from
   @#<https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile/18137056#18137056>
   @$(MAKE) -sC .ssh -f $(abspath $(lastword $(MAKEFILE_LIST))) ssh
endif

git: ## Generators: generates "${HOME}/.gitconfig" file using 'includes' directives
ifeq ($(notdir $(CURDIR)), .gitconfig.d)
   $(info running $@)

   $(eval TEMPLATE := "config.template")
   $(eval DIR := ".gitconfig.d")

   @if [ -d $(DIR) ]; then \
      cp -ai $(TEMPLATE) $(CONFIG_FILE); \
      $(info going through all 'include' lines and replace them with the file contents) \
      for line in $(shell grep -n ^include $(TEMPLATE) | sed -re 's;^include ;;' | sort -r); do \
         lineno=$${line%%:*}; \
         file=$${line##*:}; \
         #echo "lineno = '$$lineno'; file = '$$file'"; \
         if [ -f "$$file" ]; then \
            sed -i -re "$${lineno}r $$file" $(CONFIG_FILE); \
         fi; \
         sed -i -e "$${lineno}d" $(CONFIG_FILE); \
      done; \
      $(info ) \
      $(info config file created here:) \
      realpath $(CONFIG_FILE); \
   else \
      echo $(DIR) "doesn't exist!"; \
   fi
else
   @# Makefile path determination from
   @#<https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile/18137056#18137056>
   @$(MAKE) -sC .gitconfig.d -f $(abspath $(lastword $(MAKEFILE_LIST))) git
endif

.PHONY: dev
dev: ## Aliases: runs 'git-hooks'
   @$(MAKE_COMMAND) git-hooks

git-hooks:
   @$(MAKE_COMMAND) $(subst .githooks, .git/hooks, $(wildcard .githooks/*))
.git/hooks/%: .githooks/% ## Automatic: creates symlinks for all git hooks from '.githooks' to '.git/hooks'
   @[ -h $@ ] || ln -siv ../../$< $@

.PHONY: check-defs
check-defs: $(shell find -regex '.*\.md\(\.tpl\)?') ## Miscellaneous: checks all Markdown files for unused definitions
   @/bin/bash -c '\
      for file in $^; do \
         for footnote in $$(\
               cat $$file | \
               sed -rne '\''s;^(\[[^]]+\]):.*;\1;p'\'' | \
               sed -re '\''s;[][*];\\&;g'\'' | \
               sed -re "s;^;[^^];" | \
               sed -re "s; ;\o1;g" \
            ); do \
            footnote=$$(echo "$$footnote" | tr "\1" " "); \
            egrep -iq --color=always "$$footnote" $$file || \
               footnotes="$$footnotes\n'\''$$(echo $$footnote | sed -re "s;^\[\^\^\];;" -e "s;[*^\];;g")'\'' is unused"; \
         done; \
         if [[ -n "$$footnotes" ]]; then \
            echo -n "$$file:" && \
            echo -e "$$footnotes" && \
            echo && unset footnotes; \
         fi; \
         for def in $$(\
               cat $$file | \
               sed -rne '\''s;.*\[[^]]+\]\[([^]]+)\].*;\1;gp'\'' | \
               sed -re '\''s;[][*];\\&;g'\'' | \
               sed -re "s; ;\o1;g"; \
               cat $$file | \
               sed -rne '\''s;.*\[([^]]+)\]\[\].*;\1;gp'\'' | \
               sed -re '\''s;[][*];\\&;g'\'' | \
               sed -re "s; ;\o1;g"; \
            ); do \
            def=$$(echo "$$def" | tr "\1" " "); \
#            echo "def = '\''$$def'\''"; \
            egrep -iq --color=always "^\[$$def\]:" $$file || \
               defs="$$defs\n'\''$$def'\'' is undefined"; \
         done; \
         if [[ -n "$$defs" ]]; then \
            echo -n "$$file:" && \
            echo -e "$$defs" && \
            echo && unset defs; \
         fi; \
      done; \
   '

.PHONY: check-md-links
check-md-links: $(shell find -regex '.*\.md\(\.tpl\)?') ## Miscellaneous: checks all Markdown files for unused definitions
   -@echo
   -@echo
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo $(shell echo '$@' | tr '[:lower:]' '[:upper:]')
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo
   @for file in $^; do \
      refs="$$(grep -Eo '\[[^]]+\]\[[^]]*\]' $${file} | sort -u | wc -l)"; \
      defs="$$(grep -Eo '^\[[^]]+\]: ' $${file} | sort -u | wc -l)"; \
      if [ "$${refs}" != "$${defs}" ]; then \
         errors="$$((errors + 1))"; \
         echo "$${file} has $${refs} reference(s) but $${defs} definition(s)"; \
      fi; \
   done; \
   if [ -n "$${errors}" ]; then \
      echo "$${errors} error(s) found"; \
   fi

.PHONY: generate-docs
generate-docs: check-md-links $(shell find -regex '.*\.md\(\.tpl\)?') ## Generators: Regenerates Markdown files (including ToC and 'make help' output)
   -@echo
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo $(shell echo '$@' | tr '[:lower:]' '[:upper:]')
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo
   @echo "Generating docs..."
   @for file in $^; do \
      [ -s $${file} ] || continue; \
      TEMP_FILE="$$(mktemp -p $(REPO_ROOT))"; \
      OUTPUT_FILENAME="$${file%%.tpl}"; \
      MAKEFILE_HELP="$$($(REPO_ROOT)/ci/scripts/makefile_help.sh $(MAKEFILE_LIST))" \
      TOC="$$( \
         sed -rne 's;^(##+) (.*);\1- [\2](\#\L\2);p' $(REPO_ROOT)/$${file} | \
         sed -Ee 's;^(#+);\1\1;' | \
         awk 'BEGIN{FS=OFS="-"} {gsub(/#/, " ", $$1)} $$1' | \
         awk 'BEGIN{FS="[]][(]"; OFS="]("} {gsub(/[ ]/, "-", $$2)} {gsub(/[/()`.]/, "", $$2)}; $$2=$$2")"' | \
         sed -e 's;^    ;;' \
      )" \
      envsubst \
      '\
      $${MAKEFILE_HELP} \
      $${TOC} \
      ' \
      < $(REPO_ROOT)/$${file} \
      | grep -v '^ *<!-- # vim:' | tee $${TEMP_FILE} >/dev/null; \
      if diff $${TEMP_FILE} $(REPO_ROOT)/$${OUTPUT_FILENAME} >/dev/null 2>&1; then \
         echo "no changes for $${file}"; \
         rm $${TEMP_FILE}; \
      else \
         mv -fu $${TEMP_FILE} $(REPO_ROOT)/$${OUTPUT_FILENAME}; \
      fi; \
   done

.PHONY: pre-commit-install
pre-commit-install: ## Linting: Install pre-commit
   -@echo
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo $(shell echo '$@' | tr '[:lower:]' '[:upper:]')
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo
   -@command -v -- pipenv >/dev/null 2>&1 || pip3 install pipenv
   -@if pipenv run pre-commit -V >/dev/null 2>&1; then \
        echo "$(shell pipenv run pre-commit -V) already installed"; \
     else \
        echo "installing pre-commit..." && \
           pipenv install pre-commit; \
     fi

.PHONY: pre-commit-install-hooks
pre-commit-install-hooks: pre-commit-install ## Linting: Install pre-commit hooks
   -@echo
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo $(shell echo '$@' | tr '[:lower:]' '[:upper:]')
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo
   -pipenv run pre-commit install

.PHONY: pre-commit
pre-commit: pre-commit-install ## Linting: Lints all files changed between the default branch and the current branch
   -@echo
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo $(shell echo '$@' | tr '[:lower:]' '[:upper:]')
   -@echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
   -@echo
   -pipenv run pre-commit run -v --show-diff-on-failure --color=always --files $(CHANGED_FILES)

.PHONY: help
help: ## Miscellaneous: returns this Makefile's commands and their descriptions in a formatted table
   @ci/scripts/makefile_help.sh $(MAKEFILE_LIST) 1

#test:
#   @DIR="config.d"; \
#   CONFIG_FILE="config.new"; \
#   cd ".ssh"; \
#   if [ -d "$$DIR" ]; then \
#      if [ -f "$$DIR/$$CONFIG_FILE" ]; then \
#         rm "$$DIR/$$CONFIG_FILE"; \
#      fi; \
#      for FILE in "$$DIR"/*; do \
#         cat $$FILE >> "$$DIR"/$$CONFIG_FILE; \
#         echo >> "$$DIR"/$$CONFIG_FILE; \
#      done; \
#   else \
#      echo "$$DIR doesn't exist!"; \
#   fi
