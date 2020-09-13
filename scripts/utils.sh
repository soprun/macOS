#!/bin/sh

#set -euo pipefail

# Shared functions for deploying solutions

# https://gist.github.com/vratiu/9780109

# Colors
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

log_debug() {
  logger -p user.debug -t "$(basename "${0}")" "$@"
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

# https://en.gravatar.com/site/implement/hash/
function email_to_hash() {
  echo -n $@ | tr '[A-Z]' '[a-z]' | md5
}

# Checking for existing SSH keys
#function ssh-keys-list() {
#  ls -alG ~/.ssh
#}

# ISO 8601 — международный стандарт, выпущенный организацией ISO, который описывает форматы дат и времени
# и даёт рекомендации для его использования в международном контексте

# 2020-09-12T11:28:36
# readonly iso8601=$(date '+%Y-%m-%dT%H:%M:%S')
# 2020.09.12-11:28:36
# readonly date_file=$(date '+%Y.%m.%d-%H:%M:%S')
# 2020-09-12-11-28
# readonly date_file_dash=$(date '+%Y-%m-%d-%H-%M')

#input_env() {
#  local value
#  local default_value="$(printenv $1)"
#  read -p "$(printf "Input $1 $COLOR_CYAN[$default_value] "$COLOR_RESET)" value
#  export $1="${value:-$default_value}"
#  log_info "$(printenv $1)"
#}
#
#input_env ID_NAME
#input_env ID_EMAIL
#input_env ID_USER
