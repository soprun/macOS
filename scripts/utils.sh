#!/bin/sh

# Shared functions for deploying solutions

# Get the absolute path to a file
# Arguments:
#   $1 - relative path to convert
# Returns:
#   Absolute path of file
function abspath() {
  if [ -d "$1" ]; then
    # dir
    (
      cd "$1"
      pwd
    )
  elif [ -f "$1" ]; then
    # file
    if [[ $1 = /* ]]; then
      echo "$1"
    elif [[ $1 == */* ]]; then
      echo "$(
        cd "${1%/*}"
        pwd
      )/${1##*/}"
    else
      echo "$(pwd)/$1"
    fi
  fi
}
