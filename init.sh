#!/bin/bash

###
### Settings
###

# Be strict
#set -e
#set -u
#set -o pipefail

set -e
[ -n "$BASH_PROFILE_DEBUG" ] && set -x

###
### Variables
###

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
### Environment variables fiel
###

if [ ! -f "$CWD/.env.local" ]; then
  log_warn "$CWD/.env.local is not installed."

  echo "BASH_PROFILE_DEBUG=true" > "$CWD/.env.local"
fi

###
### Create symlink
###

declare -a files=(
  "${CWD}/shell/.bash_aliases::${HOME}/.bash_aliases"
  "${CWD}/shell/.bashrc::${HOME}/.bashrc"
  "${CWD}/shell/.profile::${HOME}/.profile"
  "${CWD}/shell/.zprofile::${HOME}/.zprofile"
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

rm "${HOME}/bin"
ln -sf "${CWD}/bin" "${HOME}/bin"
chmod -R 755 "${HOME}/bin"

###############################################################################
# Git
###############################################################################

#git config --global user.name "${GIT_NAME}"
#git config --global user.email "${GIT_EMAIL}"
#git config --global commit.gpgsign ${GIT_GPG_SIGN}
#git config --global gpg.program "${GIT_GPG_PROGRAM}"
#git config --global user.signingkey "${GIT_GPG_KEY}"
#git config --global core.editor "${GIT_EDITOR}"

# https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git
#git config --global push.followTags true

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

#echo "export PATH="$PATH:$HOME/MyPrograms"" > "$HOME/.env"

#echo "export PATH="$PATH:$HOME/MyPrograms"" > "$HOME/.env"

#read -r -p "github_token: " input_push
#
#echo $input_push;

#if [[ "$git_push" =~ ^([yY][eE][sS]|[yY])$ ]]; then
#  if ! git push origin --follow-tags >/dev/null 2>/dev/null; then
#    log_warn "An error occurred when pushing tag: $tag_name"
#  fi
#fi
