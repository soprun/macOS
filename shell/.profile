###
### Default environment variables
###

# set -o allexport
# set +o allexport

#if [ -e "${HOME}/.env" ]; then
#  # shellcheck source=../.env
#  . "${HOME}/.env"
#fi
#
#if [ -e "${HOME}/.env.local" ]; then
#  # shellcheck source=../.env
#  . "${HOME}/.env.local"
#fi

###
### Default environment variables
###

export PATH="${PATH}:${HOME}/bin"
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
#export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

###
### Docker environment variables
### env | grep DOCKER

export DOCKER_DEBUG=0
export DOCKER_BUILDKIT=1
export DOCKER_STACK_ORCHESTRATOR=kubernetes
export COMPOSE_DOCKER_CLI_BUILD=1
# export BUILDKIT_PROGRESS=plain

eval $(docker-machine env default)

###
### GNU Privacy Guard
### https://github.com/drduh/YubiKey-Guide#ssh
###

# GPG_KEY_ID="B7502F96C5DC44C2"
# GPG_KEY_EMAIL="mail@soprun.com"
# GPG_KEY_FINGERPRINT=""
# GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
# GPG_KEY_SERVER="keys.openpgp.org"

###
### Include .bashrc if it exists
###

if [ -e "${HOME}/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "${HOME}/.bashrc"
fi
