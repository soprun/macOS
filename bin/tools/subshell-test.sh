#!/bin/bash

USAGE_DESCRIPTION="Running a shell script launches a new process, a subshell."

# see: https://tldp.org/LDP/abs/html/subshells.html#SUBSHELLSREF

# shellcheck disable=SC1091
# shellcheck source=../shell-common
#source "${SHELL_HOME}/shell-common"

(
  # Inside parentheses, and therefore a subshell . . .
  while true; do # Endless loop.
    echo "Subshell running . . ."
  done
)

#  Script will run forever,
#+ or at least until terminated by a Ctl-C.

exit $? # End of script (but will never get here).
