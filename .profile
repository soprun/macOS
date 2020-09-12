# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

export LANG="en_US.UTF-8"
export CLICOLOR="1"
export EDITOR="code" # $EDITOR - текстовый редактор по умолчанию

#if [[ -f $HOME/.bashrc ]]; then
#  # shellcheck source=./.bashrc
#  . $HOME/.bashrc
#fi

BASH_PROFILE_HOME="${BASH_PROFILE_HOME:-$HOME/.bash}"
BASH_PROFILE_BIN="${BASH_PROFILE_BIN:-${BASH_PROFILE_HOME}/bin}"

export BASH_PROFILE_HOME
export BASH_PROFILE_BIN
export PATH="${PATH}:${BASH_PROFILE_BIN}"

if [ ! -d $BASH_PROFILE_HOME ]; then
  printf "\033[0;31mDirectory ${BASH_PROFILE_HOME} DOES NOT exists.\033[0m\n" >&2
fi

if [ ! -d $BASH_PROFILE_BIN ]; then
  printf "\033[0;31mDirectory ${BASH_PROFILE_BIN} DOES NOT exists.\033[0m\n" >&2
fi

#echo "${BASH_PROFILE_HOME}/.env"

if [ -f "${BASH_PROFILE_HOME}/.env" ]; then
  set -o allexport
  # shellcheck source=./.env
  . $BASH_PROFILE_HOME/.env
  set +o allexport

  # log_info 'Load environment variables'
fi
