#!/bin/bash
# /usr/local/bin

set -e

# Current working directory
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# shellcheck source=./bin/common.sh
source "${CWD}/bin/common.sh"

if [ -e "${HOME}/.env" ]; then
  # shellcheck source=./.env
  . "${HOME}/.env"
fi

if [ -e "${HOME}/.env.local" ]; then
  # shellcheck source=./.env
  . "${HOME}/.env.local"
fi

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
  "${CWD}/.env::${HOME}/.env"
  "${CWD}/.env.local::${HOME}/.env.local"
  "${CWD}/shell.log::${HOME}/shell.log"
)

for index in "${files[@]}"; do
  source_file="${index%%::*}"
  target_file="${index##*::}"

  if [ ! -f "$source_file" ]; then
    log_error "File $source_file does not exists."
  fi

  if [ -f "$target_file" ]; then
    log_warn "File $target_file exists and will be overwritten."
    rm "$target_file"
  fi

  ln -sf "$source_file" "$target_file"
  chmod 700 $target_file
  log_success "File '$source_file' symlink to '$target_file'"
done


# chmod 700 ~/.bash_profile
# chmod 700 ~/.bashrc