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
  # shellcheck source=../.env.local
  . "${HOME}/.env.local"
fi

export PATH="${PATH}:${HOME}/bin"
export LANG
export CLICOLOR
export EDITOR

# set PATH so it includes user's private bin if it exists

if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

###
### Identity environment variables
###

export ID_NAME
export ID_USER
export ID_EMAIL
export ID_GPG_KEY

###
### Git environment variables
###

#GIT_NAME="${ID_NAME}"
#GIT_EMAIL="develop@soprun.com"
#GIT_GPG_KEY="${ID_GPG_KEY}"
#GIT_GPG_SIGN=true
#GIT_GPG_PROGRAM=gpg
export GIT_EDITOR

###
### GitHub environment variables
###

export GITHUB_USER
export GITHUB_TOKEN

###
### Composer environment variables
###

export COMPOSER_HOME
export COMPOSER_CACHE_DIR
export COMPOSER_MEMORY_LIMIT
export COMPOSER_ALLOW_SUPERUSER
#export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

###
### Docker environment variables
### env | grep DOCKER

export DOCKER_DEBUG
export DOCKER_BUILDKIT
export DOCKER_STACK_ORCHESTRATOR
export COMPOSE_DOCKER_CLI_BUILD
#export BUILDKIT_PROGRESS

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

#if type brew &>/dev/null; then
#  HOMEBREW_PREFIX="$(brew --prefix)"
#  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
#    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
#  else
#    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
#      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
#    done
#  fi
#fi

###
### Include .bashrc if it exists
###

if [ -e "${HOME}/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "${HOME}/.bashrc"
fi
