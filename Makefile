.PHONY: ssh git
# from <https://stackoverflow.com/questions/2131213/can-you-make-valid-makefiles-without-tab-characters/60363121#60363121>
.RECIPEPREFIX := $(.RECIPEPREFIX) # switch to using spaces instead of tabs for recipe separators

CONFIG_FILE := "config.new.$$$$"
ssh:
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
   @# Makefile path determination from <https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile/18137056#18137056>
   @$(MAKE) -sC .ssh -f $(abspath $(lastword $(MAKEFILE_LIST))) ssh
endif

git:
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
   @# Makefile path determination from <https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile/18137056#18137056>
   @$(MAKE) -sC .gitconfig.d -f $(abspath $(lastword $(MAKEFILE_LIST))) git
endif


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