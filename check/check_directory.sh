#!/bin/bash

check_directory() {
  if [ ! -d "$@" ]; then
    log_warn "Directory $@ does not exists."
    mkdir "$@"
  fi
}

check_directory "${BASH_PROFILE_HOME}"
check_directory "${BASH_PROFILE_BIN}"
