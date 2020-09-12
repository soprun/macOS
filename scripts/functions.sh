# shellcheck shell=bash

# https://en.gravatar.com/site/implement/hash/
function email_to_hash() {
  echo -n $1 | tr '[A-Z]' '[a-z]' | md5
}

function log_info() {
  printf "=>\033[0;34m log.info: \033[0m%-6s\n" "$@"
  logger -p user.info -t "$(basename "$0")" "$@"
}

function log_error() {
  printf "=>\033[0;31m log.error: \033[0m%-6s\n" "$@" >&2
  logger -p user.error -t "$(basename "$0")" "$@"
  exit 1
}
