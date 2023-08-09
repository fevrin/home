#!/bin/bash

set -eu

MAKEFILE="$1"

CONTENT="$(sed -Ene 's;^([a-zA-Z_.%/-]+):.*?## ([^:]*): *(.*)$;\2\o1\1\o2\3;p' ${MAKEFILE})"

declare -a sections

# required for the following 'for' loop to work
OIFS="${IFS}"
IFS=$'\n'

# initial processing to retrieve the sections
for section in ${CONTENT}; do
   sections+=(${section%%$'\1'*})
done
IFS="${OIFS}"

# prints a table of the sorted sections and commands
for section in $(echo "${sections[*]}" | tr ' ' '\n' | sort -u); do
   printf "\033[36m%-30s\033[0m\n" $section
   echo "${CONTENT}" | sort | while read line; do
      echo "$line" | sed -Ene "s;^${section}\o1(.*)\o2(.*);\1\t\2;p"
   done
   echo
done | column -Lts$'\t'
