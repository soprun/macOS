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
###

export DOCKER_DEBUG=0
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
# export BUILDKIT_PROGRESS=plain

###
### GNU Privacy Guard
###

# export GPG_KEY_ID="B7502F96C5DC44C2"
# export GPG_KEY_EMAIL="mail@soprun.com"
# export GPG_KEY_FINGERPRINT=""
# export GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
# export GPG_KEY_SERVER="keys.openpgp.org"

###
### SSH-agent running!
###

if [ -z ${SSH_AGENT_PID} ]; then
  eval $(ssh-agent -s) /usr/bin/tty >/dev/null
fi

###
### GPG-agent running!
###

GPG_TTY=$(tty)
export GPG_TTY

# note: eval is used because the produced STDOUT is a bunch of ENV settings
eval $(gpg-agent --daemon --enable-ssh-support >/dev/null 2>/dev/null)
# FIXME: gpg-agent: a gpg-agent is already running - not starting a new one

# killall gpg-agent &>/dev/null;killall ssh-agent &>/dev/null

###
### Include .bashrc if it exists
###

if [ -e "${HOME}/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "${HOME}/.bashrc"
fi
