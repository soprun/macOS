#!/bin/bash

if [ -e ./colors.sh ]; then
  # shellcheck source=./colors.sh
  source ./colors.sh
fi

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


# see: https://apple.stackexchange.com/questions/256769/how-to-use-logger-command-on-sierra
### Example

#log_success 'success'
#log_info 'info'
#log_warn 'warn'
#log_error 'error'

function log_dump() {
  log_debug 'debug message...'
  log_success 'success message...'
  log_info 'info message...'
  log_warn 'warn message...'
  log_error 'error message...'
}

#log_dump
#=> log: success message...
#=> log: info message...
#=> warn: warn message...
#=> error: error message...

# log show --style compact --info --debug --predicate 'process == "logger"' --last 20m
# log stream --process logger --level debug --style syslog
