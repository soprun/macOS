#!/bin/bash

input_env() {
  local value
  local default_value="$(printenv $1)"
  read -p "$(printf "Input $1 $COLOR_CYAN[$default_value] "$COLOR_RESET)" value
  export $1="${value:-$default_value}"
  log_info "$(printenv $1)"
}

input_env ID_NAME
input_env ID_EMAIL
input_env ID_USER
