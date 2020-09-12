# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

export LANG="en_US.UTF-8"
export CLICOLOR="1"
export EDITOR="code" # $EDITOR - текстовый редактор по умолчанию

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

if [ -f "$HOME/.env" ]; then
  set -o allexport
  # shellcheck source=./.env
  . "$HOME/.env"
  set +o allexport
fi

if [ -f "$HOME/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "$HOME/.bashrc"
fi

###
### Composer environment variables
###

COMPOSER_HOME="${HOME}/.composer"
COMPOSER_CACHE_DIR="${COMPOSER_HOME}/cache"
COMPOSER_MEMORY_LIMIT="-1"
COMPOSER_ALLOW_SUPERUSER="1"
