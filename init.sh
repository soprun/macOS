#!/bin/bash

###
### Default environment variables
###

if [ -e "${HOME}/.env" ]; then
  # shellcheck source=./.env
  . "${HOME}/.env"
fi

if [ -e "${HOME}/.env.local" ]; then
  # shellcheck source=./.env.local
  . "${HOME}/.env.local"
fi

# Be very strict
set -euo pipefail
[ "$BASH_PROFILE_DEBUG" = true ] && set -x

# Current directory
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

###
### Source include
###

# shellcheck source=./bin/common.sh
. "${CWD}/bin/common.sh"

###
### System dependencies
### log_info 'Check system required dependencies'

declare -a commands=(
  docker
  docker-compose
  git
  make
  gpg
  mkcert
  openssl
  shellcheck
  tree
)

for command in "${commands[@]}"; do
  if ! command -v "$command" >/dev/null 2>/dev/null; then
    log_warn "${command} is not installed."
  fi
done

###
### Environment variables
###

if [ ! -f "$CWD/.env.local" ]; then
  log_warn "$CWD/.env.local is not installed."

  echo "BASH_PROFILE_DEBUG=true" > "$CWD/.env.local"
fi

###
### Create symlink
###

declare -a files=(
  "${CWD}/shell/.aliases::${HOME}/.aliases"
  "${CWD}/shell/.bashrc::${HOME}/.bashrc"
  "${CWD}/shell/.bash_profile::${HOME}/.bash_profile"
  "${CWD}/shell/.zshrc::${HOME}/.zshrc"

  "${CWD}/config/gpg.conf::${HOME}/.gnupg/gpg.conf"
  "${CWD}/config/gpg-agent.conf::${HOME}/.gnupg/gpg-agent.conf"
  "${CWD}/config/ssh.conf::${HOME}/.ssh/config"

  "${CWD}/.env::${HOME}/.env"
  "${CWD}/.env.local::${HOME}/.env.local"
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
  # chmod 700 $target_file
  # log_success "File '$source_file' symlink to '$target_file'"
done

###
### Create symlink bin directory
### https://chmodcommand.com/chmod-744/

rm -f "${HOME}/bin"
ln -sf "${CWD}/bin" "${HOME}/bin"
chmod -R 755 "${HOME}/bin"

###
### Git config
###

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global commit.gpgsign "$GIT_GPG_SIGN"
git config --global gpg.program "$GIT_GPG_PROGRAM"
git config --global user.signingkey "$GIT_GPG_KEY"
git config --global core.editor "$GIT_EDITOR"

# https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git
#git config --global push.followTags true

# From https://gist.github.com/danieleggert/b029d44d4a54b328c0bac65d46ba4c65
# If you want annotated tags to be GPG signed:
# git config --global tag.forceSignAnnotated true

#git config --global --list
