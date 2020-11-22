#!/bin/bash

set -e

#######################################################################
# Current working directory
#######################################################################

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
#readonly DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
#export $SHELL_DIR

# If local file does not exist, it creates an empty one.
for file in ${DIR}/{.env.local,shell.log}; do
  [ ! -f "$file" ] && touch "$file"
done
unset file

#######################################################################
# Load environment variables
#######################################################################

for file in ${DIR}/.{env,env.local}; do
  # shellcheck source=./.env
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

#######################################################################
# Create symlink bin directory
#######################################################################

local source_dir="${DIR}/bin"
local target_dir="${SHELL_BIN}"

#if [ -L "${target_dir}" ]; then
#  log_warn "Directory ${target_dir} already exists, abort installation."
#fi

rm -f "${target_dir}"

# see: https://vds-admin.ru/unix-commands/ln-link
#ln -sFh "${source_dir}" "${target_dir}"
ln -sf "${source_dir}" "${target_dir}"

chmod -R 755 "${target_dir}"

#######################################################################
# Source include
#######################################################################

# shellcheck source=./bin/shell-common
source "${SHELL_BIN}/shell-common"

log_info "Create symbolic link:"
log_success "=> source_dir: ${source_dir}"
log_success "=> target_dir: ${target_dir}"

#######################################################################
# Check system required dependencies
#######################################################################

log_info "Check system required dependencies"

declare -a commands=()

commands=(
  docker
  docker-compose
  git
  make
  gpg
  mkcert
  openssl
  shellcheck
  tree
  dotenv-linter
  hadolint
)

for command in "${commands[@]}"; do
  if ! command -v "$command" >/dev/null 2>/dev/null; then
    log_warn "${command} is not installed."
  fi
done

#######################################################################
# Brew: Installing packages...
#######################################################################

log_info "Brew: Installing packages..."
# brew install "${packages[@]}"

#######################################################################
# Brew: Cleaning up...
#######################################################################

log_info "Brew: Cleaning up..."
# brew cleanup

#######################################################################
# Create symlink .bash_profile & .env files
#######################################################################

files=(
  "${DIR}/.env::${HOME}/.env"
  "${DIR}/.env.local::${HOME}/.env.local"

  "${DIR}/shell.log::${HOME}/shell.log"

  "${DIR}/profile-bash/.bash_aliases::${HOME}/.bash_aliases"
  "${DIR}/profile-bash/.bash_profile::${HOME}/.bash_profile"
  "${DIR}/profile-bash/.bashrc::${HOME}/.bashrc"

  "${DIR}/profile-zsh/.zshrc::${HOME}/.zshrc"
)

for index in "${files[@]}"; do
  source_file="${index%%::*}"
  target_file="${index##*::}"

  if [ ! -f "$source_file" ]; then
    error_exit "File $source_file does not exists."
  fi

  if [ -f "$target_file" ]; then
    log_warn "File $target_file exists and will be overwritten."
    rm "$target_file"
  fi

  ln -sf "$source_file" "$target_file"
  chmod 700 $target_file
  log_success "File '$source_file' symlink to '$target_file'"
done

#######################################################################
# Git config
#######################################################################

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global commit.gpgsign "$GIT_GPG_SIGN"
git config --global gpg.program "$GIT_GPG_PROGRAM"
git config --global user.signingkey "$GIT_GPG_KEY"
git config --global core.editor "$GIT_EDITOR"
# git config --global credential.helper osxkeychain
#git config --global credential.github.com.useHttpPath true

# https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git
#git config --global push.followTags true

# From https://gist.github.com/danieleggert/b029d44d4a54b328c0bac65d46ba4c65
# If you want annotated tags to be GPG signed:
# git config --global tag.forceSignAnnotated true

#git config --global --list
