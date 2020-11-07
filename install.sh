#!/bin/bash

set -e

# Current working directory
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# shellcheck source=./bin/common
source "${CWD}/bin/common"

# /usr/local/bin

if [ ! -e "${HOME}/.env" ]; then
  # shellcheck source=./.env
  . "${HOME}/.env"
fi

if [ -e "${HOME}/.env.local" ]; then
  # shellcheck source=./.env.local
  . "${HOME}/.env.local"
fi

exit 0

# Entry point
main() {
  log_title "Starting installation script!"

  local source_dir="${CWD}/bin"
  local target_dir="${HOME}/bin"

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
    gpg
    openssl
    shellcheck
    dotenv-linter
    hadolint
  )

  for command in "${packages[@]}"; do
    if ! command_exists "$command"; then
      log_warn "${command} is not installed."
    fi
  done

  # log_info "Brew: Installing packages..."
  # brew install "${packages[@]}"

  # log_info "Brew: Cleaning up..."
  # brew cleanup
}

main "$@"
