#!/bin/bash

set -e

# shellcheck source=../shell-common
source "${SHELL_BIN}/shell-common"

date_time=$(date +"%Y/%m/%d %H:%M:%S")
log_info $date_time

#######################################################################
# Load environment variables
#######################################################################

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

log_info "dir: $DIR"

for file in ${HOME}/.{env,env.local}; do
    # shellcheck source=./.env
    [ -r "$file" ] && [ -f "$file" ] && log_info "file: ${file}"
done
unset file

success_exit "Exit!.."
