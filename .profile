# shellcheck shell=bash

# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

if [ -f ~/.bashrc ]; then
  # shellcheck source=./.bashrc
  . ~/.bashrc
fi
