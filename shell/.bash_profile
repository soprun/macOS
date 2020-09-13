# Be very strict
# set -euo pipefail
# Enable tracing
# set -ex

###
### Default environment variables
###

# set -o allexport
# set +o allexport

if [ -e "${HOME}/.env" ]; then
  # shellcheck source=../.env
  . "${HOME}/.env"
fi

if [ -e "${HOME}/.env.local" ]; then
  # shellcheck source=../.env
  . "${HOME}/.env.local"
fi

###
### Default environment variables
###

echo "shell: '${SHELL}'"
echo "version: '${BASH_VERSION}'"

export LANG="en_US.UTF-8"
export CLICOLOR="1"
export EDITOR="code"

# export PATH="${PATH}:/usr/local/bin"
# chsh -s /usr/local/bin/bash

###
### Identity environment variables
###

export ID_NAME
export ID_USER
export ID_EMAIL
export ID_GPG_KEY

###
### Composer environment variables
###

export COMPOSER_HOME="${HOME}/.composer"
export COMPOSER_CACHE_DIR="${COMPOSER_HOME}/cache"
export COMPOSER_MEMORY_LIMIT="-1"
export COMPOSER_ALLOW_SUPERUSER="1"
export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

###
### Docker environment variables
###

export DOCKER_DEBUG=0
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
# export BUILDKIT_PROGRESS=plain

###
### set PATH so it includes user's private bin if it exists
###

if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

###
### Default environment variables
###

# if running bash
#if [ -n $BASH_VERSION ]; then
#fi

# include .bashrc if it exists
if [ -e "${HOME}/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "${HOME}/.bashrc"
fi

#printenv | sort
#return
