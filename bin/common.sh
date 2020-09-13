#!/bin/sh

# Be very strict
set -euo pipefail

###
### Colors
###

COLOR_RESET='\033[0m' # Text Reset

# Regular Colors
COLOR_BLACK="\033[0;30m"  # Black
COLOR_RED="\033[0;31m"    # Red
COLOR_GREEN="\033[0;32m"  # Green
COLOR_YELLOW="\033[0;33m" # Yellow
COLOR_BLUE="\033[0;34m"   # Blue
COLOR_PURPLE="\033[0;35m" # Purple
COLOR_CYAN="\033[0;36m"   # Cyan
COLOR_WHITE="\033[0;37m"  # White

###
### logger
###

log_debug() {
  logger -p user.debug -t "$(basename "${0}")" "$@"
  sleep .3
}

log_success() {
  printf "=>$COLOR_GREEN log:$COLOR_RESET $*\n$COLOR_RESET"
  logger -p user.info -t "$(basename "${0}")" "$@"
  sleep .3
}

log_info() {
  printf "=>$COLOR_BLUE log:$COLOR_RESET $*\n$COLOR_RESET"
  logger -p user.info -t "$(basename "${0}")" "$@"
  sleep .3
}

log_warn() {
  printf "=>$COLOR_YELLOW warn:$COLOR_RESET $*\n$COLOR_RESET"
  logger -p user.warn -t "$(basename "${0}")" "$@"
}

log_error() {
  printf "=>$COLOR_RED error:$COLOR_RESET $*\n$COLOR_RESET" >&2
  logger -p user.error -t "$(basename "${0}")" "$@"
  exit 1
}

# see: https://apple.stackexchange.com/questions/256769/how-to-use-logger-command-on-sierra
### Example

#log_debug 'success'
#log_success 'success'
#log_info 'info'
#log_warn 'warn'
#log_error 'error'

###
### Shared functions for deploying solutions
### https://gist.github.com/vratiu/9780109
###

# https://en.gravatar.com/site/implement/hash/
function email_to_hash() {
  echo -n $@ | tr '[A-Z]' '[a-z]' | md5
}

function command_exists() {
  command -v "$@" >/dev/null 2>&1
}

#command_exists docker || {
#  log_error "Command 'docker' is not installed."
#}
