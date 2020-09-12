# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

if [ -f "$HOME/.env" ]; then
  # set -o allexport
  # shellcheck source=./../.env
  . "$HOME/.env"
  # set +o allexport
fi

if [ -f "$HOME/.env.local" ]; then
  # set -o allexport
  # shellcheck source=./../.env
  . "$HOME/.env.local"
  # set +o allexport
fi

if [ -f "$HOME/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "$HOME/.bashrc"
fi

###
### Default environment variables
###

export LANG="en_US.UTF-8"
export CLICOLOR="1"
export EDITOR="code" # $EDITOR - текстовый редактор по умолчанию

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

export GIT_NAME="${ID_NAME}"
export GIT_EMAIL="develop@soprun.com"
export GIT_GPG_KEY="${ID_GPG_KEY}"
export GIT_GPG_SIGN=true
export GIT_GPG_PROGRAM=gpg
export GIT_EDITOR=vim

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
