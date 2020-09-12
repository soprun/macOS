#!/bin/bash

if [ -z ${BASH_PROFILE_HOME:-} ]; then
  log_error "Environment BASH_PROFILE_HOME does not exists."
fi

if [ -z ${BASH_PROFILE_BIN:-} ]; then
  log_error "Environment BASH_PROFILE_BIN does not exists."
fi
