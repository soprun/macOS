#!/bin/bash

#clear -x

#set -e

##!/usr/bin/env bash

# OUTPUT-COLORING
red=$(tput setaf 1)
green=$(tput setaf 2)
NC=$(tput setaf 0) # or perhaps: tput sgr0

output()
{
  #  local style_start
  #  local style_end

  if [ "${2:-}" != "" ]; then
    case $2 in
      "success")
        style_start="\033[0;32m"
        style_end="\033[0m"
        ;;
      "info")
        style_start="\033[31;34m"
        style_end="\033[0m"
        ;;
      "error")
        style_start="\033[31;31m"
        style_end="\033[0m"
        ;;
      "warning")
        style_start="\033[33m"
        style_end="\033[39m"
        ;;
      "heading")
        style_start="\n\033[1;34m\x1b[7m"
        style_end="\033[22;39m\n"
        ;;
    esac
  fi

  echo "\033[0m${style_start}${1}${style_end}\033[0m\n"
  sleep .3
}

function error_exit()
{
  output "$1" "error" >&2
  exit 1
}

#verbose=0
#test=0
#debug=0

#for i; do
#    case $i in
#    --test | --verbose | --debug)
#        shift             # Remove option from command line
#        name=${i#--}      # Delete option prefix
#        eval "is_$name=1" # make *new* variable
#        ;;
#    esac
#done

if [ 1 -eq "$debug" ]; then
  output "Debug mode is enabled!" "warning"

  set -x
fi

#output "verbose: $verbose"
#output "test: $test"
#output "debug: $debug"

declare -a commands

commands+=("docker container ls -a")
#commands+=("exec ip-external")
commands+=("exit 1")
commands+=("echo 'sleep 4'")
commands+=("docker image ls -a")
#commands+=("sleep 6")
#commands+=('curl -X GET "http://httpbin.org/delay/10" -H "accept: application/json"')
#commands+=("sleep 2")
commands+=("pwds")
commands+=('curl -X GET "http://httpbin.org/status/500" -H "accept: text/plain"')

waitall()
{ # PID...
  ## Wait for children to exit and indicate whether all exited with 0 status.
  local errors=0
  while :; do
    debug "Processes remaining: $*"
    for pid in "$@"; do
      shift
      if kill -0 "$pid" 2>/dev/null; then
        debug "$pid is still alive."
        set -- "$@" "$pid"
      elif wait "$pid"; then
        debug "$pid exited with zero exit status."
      else
        debug "$pid exited with non-zero exit status."
        ((++errors))
      fi
    done
    (("$#" > 0)) || break
    # TODO: how to interrupt this sleep when a child terminates?
    sleep ${WAITALL_DELAY:-1}
  done
  ((errors == 0))
}

debug()
{
  if [ 1 -eq "$debug" ] || [ 1 -eq "$test" ] || [ 1 -eq "$verbose" ]; then
    echo "DEBUG: $*" >&2
  fi
}

output "Starting service" "info"

#for cmd in "$@"; do {
#  log_info "Process \"$cmd\" started"
#  $cmd &
#  pid=$!
#  PID_LIST+=" $pid"
#}; done

for command in "${commands[@]}"; do
  output "Command \"$command\" started!" "info"
  $command &>/dev/null 2>&1 &
  PID=$!
  output "Command \"$command\" PID ${red}(${!})" "info"
  waitall $PID
  exited_status=$?
  output "Command \"$command\" exit status: $exited_status" "info"

  unset command
done
unset commands

#output "Command execution is successful!" "success"

#output "jobs:"
#jobs

output "Waiting jobs" "info"
#waitall

output "All jobs completed." "success"

exit 0

set -euo pipefail

[ -f ./docker/versions2.json ] # run "versions.sh" first

echo "213"

#echo Building alexellis2/href-counter:build
#
#docker build \
#    --build-arg https_proxy=$https_proxy
#    --build-arg http_proxy=$http_proxy \
#    -t alexellis2/href-counter:build . \
#    -f Dockerfile.build
#
#docker container create --name extract alexellis2/href-counter:build
#docker container cp extract:/go/src/github.com/alexellis/href-counter/app ./app
#docker container rm -f extract
#
#echo Building alexellis2/href-counter:latest
#
#docker build --no-cache -t alexellis2/href-counter:latest .
#rm ./app
