#!/bin/bash

if [ -e ./colors.sh ]; then
  # shellcheck source=./colors.sh
  source ./colors.sh
fi

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

#declare dateFormat="+%Y-%m-%d %H:%M:%S"
#    declare date=$(date "${dateFormat}")

LogLevel="${1:-1}"

# String manipulation to get a log
# file named after this script.
BaseName=$(basename ${0:-${0}})
LogFile="${BaseName%.*}.log"

logIt()
{

    declare -i rval=0
    declare msgLogLevel="${1}"
    declare msg="${2}"

    declare dateFormat="+%Y-%m-%d %H:%M:%S"
    declare date=$(date "${dateFormat}")

    declare logMsg
    declare logFile

    if [ ${msgLogLevel} -ge ${LogLevel:-0} ]
    then
        msg=${2}
        logMsg="${date}|${msgLogLevel}|${BASH_LINENO[0]}|${msg}"
        logFile=${3:-${LogFile:-${/dev/null}}}

        # First technique -- using echo
        #echo "${logMsg}" | tee -a ${logFile}

        # Second technique -- using printf
        printf "%s\n" "${logMsg}" | tee -a ${logFile}

        rval=$?
    else
        :
    fi

    return ${rval}

}

#logIt 1 "This is logging at level 1"
#logIt 2 "This is logging at level 2"
#logIt 3 "This is logging at level 3"
#logIt 4 "This is logging at level 4"
