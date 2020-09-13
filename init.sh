#!/usr/bin/env bash

# Be very strict
set -euo pipefail

# Determine the build script's actual directory, following symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  SOURCE="$(readlink "$SOURCE")"
done

# Get absolute directory of this script
SOURCE_DIR="$(cd -P "$(dirname "${SOURCE}")" && pwd)"

# shellcheck source=./bin/common.sh
source "${SOURCE_DIR}/bin/common.sh"

log_info $SHELL
log_info $BASH_VERSION

# shellcheck source=./scripts/check-dependence.sh
# source "${SOURCE_DIR}/scripts/check-dependence.sh"

log_info 'Check system required dependencies'

declare -a commands=(
  docker
  docker-compose
  git
  make
  gpg
  mkcert
  openssl
  shellcheck
)

for command in "${commands[@]}"; do
  if ! command -v "$command" >/dev/null 2>/dev/null; then
    log_warn "${command} is not installed."
  fi
done

declare -a files=(
  "${SOURCE_DIR}/shell/.bash_aliases::${HOME}/.bash_aliases"
  "${SOURCE_DIR}/shell/.bashrc::${HOME}/.bashrc"
  "${SOURCE_DIR}/shell/.profile::${HOME}/.profile"
  "${SOURCE_DIR}/shell/.zprofile::${HOME}/.zprofile"
  "${SOURCE_DIR}/shell/.zshrc::${HOME}/.zshrc"

  "${SOURCE_DIR}/config/gpg.conf::${HOME}/.gnupg/gpg.conf"
  "${SOURCE_DIR}/config/gpg-agent.conf::${HOME}/.gnupg/gpg-agent.conf"
  "${SOURCE_DIR}/config/ssh.conf::${HOME}/.ssh/config"

  # "${SOURCE_DIR}/.env::${HOME}/.env"
  # "${SOURCE_DIR}/.env.local::${HOME}/.env.local"
)

for index in "${files[@]}"; do
  source_file="${index%%::*}"
  target_file="${index##*::}"

  if [ ! -f "$source_file" ]; then
    log_error "File $source_file does not exists."
  fi

  if [ -f "$target_file" ]; then
    log_warn "File $target_file exists and will be overwritten."
    rm $target_file
  fi

  ln -sf "$source_file" "$target_file"
  chmod 700 $target_file
  # log_success "File '$source_file' symlink to '$target_file'"
done

rm -rf "${HOME}/bin"
ln -sf "${SOURCE_DIR}/bin" "${HOME}/bin"
chmod 700 "${HOME}/bin"

#if [ ! -e "${HOME}/.env.local" ]; then
#  cp "${HOME}/.env" "${HOME}/.env.local"
#fi

log_success "Macbook setup completed!"

###############################################################################
# Git
###############################################################################

#git config --global user.name "${GIT_NAME}"
#git config --global user.email "${GIT_EMAIL}"
#git config --global commit.gpgsign ${GIT_GPG_SIGN}
#git config --global gpg.program "${GIT_GPG_PROGRAM}"
#git config --global user.signingkey "${GIT_GPG_KEY}"
#git config --global core.editor "${GIT_EDITOR}"

# From https://gist.github.com/danieleggert/b029d44d4a54b328c0bac65d46ba4c65
# If you want annotated tags to be GPG signed:
# git config --global tag.forceSignAnnotated true

#git config --global --list

# https://github.com/sindresorhus/pure

# /usr/local/bin/bash
# export PATH="${PATH}:/usr/local/bin"
# chsh -s /usr/local/bin/bash
#sudo chown -R $USER /usr/local/lib/node_modules
#chsh -s /usr/local/bin/zsh
