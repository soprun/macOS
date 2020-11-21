#!/bin/zsh

# Be very strict
set -euo pipefail

#function _date_time() {
#  date +"%Y/%m/%d %H:%M:%S"
#}

#function _utc_date_time() {
#  date -u +"%Y/%m/%dT%H:%M:%SZ"
#}

# echo "$(date "+%Y.%m.%d %H:%M:%S")"

#######################################################################
#                           logger                                    #
#######################################################################

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ${HOME}/.{env,env.local,aliases}; do
  # shellcheck source=../.env
  # shellcheck source=../.bash_profile
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

#if [ -z $SHELL_LOG ]; then
#  readonly SHELL_LOG="${HOME}/shell.log"
#fi

#if [ ! -f $SHELL_LOG ]; then
#  touch "$SHELL_LOG"
#fi

# Shell working directory
readonly SHELL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# export $SHELL_DIR

#######################################################################
#                           logger                                    #
#######################################################################

## https://apple.stackexchange.com/questions/256769/how-to-use-logger-command-on-sierra

readonly SCRIPT_NAME="$(basename $0)"

log_info()
{
  printf "\033[0;34m[info]\033[0m: %s\\n" "$1"
  logger -p user.info -t "$SCRIPT_NAME" "$@"
}

log_success()
{
  printf "\033[0;32m[success]\033[0m: %s\\n" "$1"
  logger -p user.notice -t "$SCRIPT_NAME" "$@"
}

log_warn()
{
  printf "\033[0;33m[warn]\033[0m: %s\\n" "$1"
  logger -p user.warn -t "$SCRIPT_NAME" "$@"
}

log_alert()
{
  printf "\033[0;33m[alert]\033[0m: %s\\n" "$1"
  logger -p user.alert -t "$SCRIPT_NAME" "$@"
}

log_error()
{
  printf "\033[0;31m[error]\033[0m: %s\\n" "$1"
  logger -p user.error -t "$SCRIPT_NAME" "$@"
}

error_exit()
{
  log_error "$1" >&2
  exit 1
}

#######################################################################
#                           initialization                            #
#######################################################################

if [ -z $SHELL_DEBUG ]; then
  error_exit "An error occurred, the value of the variable SHELL_DEBUG was not loaded!"
fi

if [ -z $SHELL_BIN ]; then
  error_exit "An error occurred, the value of the variable SHELL_BIN was not loaded!"
fi

if [ ! -d $SHELL_DIR ]; then
  error_exit "Error: The current working directory doesn't exist, cannot proceed."
fi

if [ "${SHELL_DEBUG}" == 1 ]; then
  log_info "SHELL_BIN: $SHELL_BIN"
  log_info "SHELL_LOG: $SHELL_LOG"
  log_info "SHELL_DIR: $SHELL_DIR"
  log_info "SCRIPT_NAME: "$SCRIPT_NAME""
  log_info "SHELL_DEBUG: $SHELL_DEBUG"
fi

#######################################################################
#                           initialization                            #
#######################################################################

# for file in $SHELL_BIN/*/*; do
#   # shellcheck source=./.aliases
#   [ -r "$file" ] && [ -f "$file" ] && echo "$file"
# done
# unset file

# source "${SHELL_DIR}/../.env"
# source "${SHELL_DIR}/tools/logger"

# if [ ! -f "${SHELL_DIR}/common.sh" ]; then
#  error_exit "Error, the shared file does not exist."
#fi

# source "${SHELL_DIR}/tools/colors"
# source "${SHELL_DIR}/tools/logger"

# /usr/local/bin

# if [ "${SHELL_DEBUG}" == 1 ]; then
#   log_info "source: "$SCRIPT_NAME""
#   log_info "shell bin: $SHELL_BIN"
#   log_info "shell dir: $SHELL_DIR"
# fi

# exit 1

# # source "${SHELL_DIR}/tools/colors"
# source "${SHELL_DIR}/tools/logger"

# log_info $SHELL_DIR
# exit 0

# # Fail fast with concise message when cwd does not exist
# if ! [[ -d "$PWD" ]]; then
#   error_exit "Error: The current working directory doesn't exist, cannot proceed." >&2
# fi

#log_info 'Info!..'
#log_success 'Success!..'
#log_warn 'Warn!..'
#log_error 'Error!..'

#for file in $HOME/bin/*; do
#  # [ -r "$file" ] && [ -f "$file" ] && source "$file"
#  [ -r "$file" ] && [ -f "$file" ] && echo "$file"
#done
#unset file

# SHELL_DEBUG="0"
# SHELL_BIN="${HOME}/bin"
# SHELL_DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# log_info "SHELL_DIR: $SHELL_DIR"
# log_info "SHELL_BIN: $SHELL_BIN"

# Current working directory
# CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# command_exists() {
#   command -v "$@" >/dev/null 2>&1
# }

# Example

#command_exists docker || {
#  log_error "Command 'docker' is not installed."
#}

#for file in $HOME/bin/*/*; do
#  [ -r "$file" ] && [ -f "$file" ] && echo "$file"
#done
#unset file

#cat "${SHELL_DIR}/tools/colors"
#echo 12
