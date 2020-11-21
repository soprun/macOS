#!/bin/bash
# /usr/local/bin

set -e

# Current working directory
# readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
#export $SHELL_DIR

# shellcheck source=./bin/shell-common
source "${DIR}/bin/shell-common"

if [ -e "${HOME}/.env" ]; then
  # shellcheck source=./.env
  source "${HOME}/.env"
fi

if [ -e "${HOME}/.env.local" ]; then
  # shellcheck source=./.env
  source "${HOME}/.env.local"
fi

log_info "Starting installation script!"

local source_dir="${DIR}/bin"
local target_dir="${HOME}/bin"

if [ -L "${target_dir}" ]; then
  log_warn "Directory ${target_dir} already exists, abort installation."
fi

# see: https://vds-admin.ru/unix-commands/ln-link
#ln -sFh "${source_dir}" "${target_dir}"

log_info "Create symbolic link:"
log_info "=> source_dir: ${source_dir}"
log_info "=> target_dir: ${target_dir}"

log_info "Check system dependencies!"

#declare -a packages=(
#  git
#  docker
#  docker-compose
#  make
#  gpg
#  openssl
#  shellcheck
#  dotenv-linter
#  hadolint
#)
#
#for command in "${packages[@]}"; do
#  if ! command_exists "$command"; then
#    log_warn "${command} is not installed."
#  fi
#done

# log_info "Brew: Installing packages..."
# brew install "${packages[@]}"

# log_info "Brew: Cleaning up..."
# brew cleanup

files=(
  "${DIR}/.env::${HOME}/.env"
  "${DIR}/.env.local::${HOME}/.env.local"

  # "${DIR}/shell.log::${HOME}/shell.log"

  "${DIR}/profile-bash/.bash_aliases::${HOME}/.bash_aliases"
  "${DIR}/profile-bash/.bash_profile::${HOME}/.bash_profile"

  "${DIR}/profile-zsh/.zshrc::${HOME}/.zshrc"
)

for index in "${files[@]}"; do
  source_file="${index%%::*}"
  target_file="${index##*::}"

  if [ ! -f "$source_file" ]; then
    log_error "File $source_file does not exists."
  fi

  if [ -f "$target_file" ]; then
    log_error "File $target_file exists and will be overwritten."
    rm "$target_file"
  fi

  ln -sf "$source_file" "$target_file"
  chmod 700 $target_file
  log_success "File '$source_file' symlink to '$target_file'"
done

# chmod 700 ~/.bash_profile
# chmod 700 ~/.bashrc
