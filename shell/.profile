# Be very strict
set -euo pipefail

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

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export LANG="en_US.UTF-8"
export CLICOLOR="1"
export EDITOR="code"

# set PATH so it includes user's private bin if it exists

if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

#echo "shell: '${SHELL}'"
#echo "version: '${BASH_VERSION}'"

###
### Identity environment variables
###

export ID_NAME="Vladislav Soprun"
export ID_USER="soprun"
export ID_EMAIL="mail@soprun.com"
export ID_GPG_KEY="8120213055C84C2C3324FB08B7502F96C5DC44C2"

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
### Include .bashrc if it exists
###

if [ -e "${HOME}/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "${HOME}/.bashrc"
fi
