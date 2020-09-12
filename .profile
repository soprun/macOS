# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

if [ -f "$HOME/.env" ]; then
  # set -o allexport
  # shellcheck source=./.env
  . "$HOME/.env"
  # set +o allexport
fi

if [ -f "$HOME/.env.local" ]; then
  # set -o allexport
  # shellcheck source=./.env
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
### Composer environment variables
###

export COMPOSER_HOME
export COMPOSER_CACHE_DIR
export COMPOSER_MEMORY_LIMIT
export COMPOSER_ALLOW_SUPERUSER
export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

#if [ -z "${GIT_TAG:-}" ]; then
#  GIT_TAG="$(git describe --tags --abbrev=0)"
#fi
