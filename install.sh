#!/bin/bash

clear

set -e

# Current working directory
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# shellcheck source=./bin/common
source "${CWD}/bin/common"

# /usr/local/bin

# Entry point
main() {
  log_title "Starting installation script!"

  local source_dir="${CWD}/bin"
  local target_dir="${HOME}/bin"

  # rm -r "${target_dir}" &>/dev/null;

  if [ -L "${target_dir}" ]; then
    log_warn "Directory ${target_dir} already exists, abort installation."
  fi

  # see: https://vds-admin.ru/unix-commands/ln-link
  ln -sFh "${source_dir}" "${target_dir}"

  log_title "Create symbolic link:"
  log_info "=> source_dir: ${source_dir}"
  log_info "=> target_dir: ${target_dir}"

  log_title "Check system dependencies!"

  packages=(
    git
    docker
    docker-compose
    make
  )

  for command in "${packages[@]}"; do
    if ! command_exists "$command"; then
      error_exit "${command} is not installed."
    fi
  done

  log_info "Brew: Installing packages..."
  # brew install "${packages[@]}"

  # log_info "Brew: Cleaning up..."
  # brew cleanup
}

main

# chflags nohidden ~/usr/local/bin-other
# ln -sf "${CWD}/bin-other" "${HOME}/bin-other"
# log_info "AdGuard Home will be installed to ${BIN_DIR}"

#  if [ ! -d "${CWD}/bin" ]; then
#    echo "123"
#  fi
