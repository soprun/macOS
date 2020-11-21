#!/usr/bin/env bash

# https://www.cubicrace.com/2016/03/efficient-logging-mechnism-in-shell.html

# -f /var/log/myapp.log

if [ -z "$SCRIPT_NAME" ]; then
  readonly SCRIPT_NAME="$(basename $0)"
fi

function _date_time() {
    date +"%Y/%m/%d %H:%M:%S"
}

function _utc_date_time() {
    date -u +"%Y/%m/%dT%H:%M:%SZ"
}

# if [ "${SHELL_DEBUG}" == 1 ] ; then
#   log_info "source: $SCRIPT_NAME"
# fi

# log() {
#   echo "$@"
#   logger -p user.notice -t $SCRIPT_NAME "$@"
# }

# err() {
#   echo "$@" >&2
#   logger -p user.error -t $SCRIPT_NAME "$@"
# }

# log "writing to stdout"
# err "writing to stderr"
