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
  # shellcheck source=./.env
  . "$HOME/.env"
fi

if [ -f "$HOME/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "$HOME/.bashrc"
fi
