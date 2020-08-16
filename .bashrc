# shellcheck shell=bash

# Поместите в .bashrc файл команды, которые должны запускаться каждый раз при запуске новой оболочки.
# Сюда входят ваши псевдонимы и функции, пользовательские подсказки, настройки истории и т.д.

export PATH="$HOME/bin:$PATH"
export EDITOR="vim"

if [ -f ~/.bash_aliases ]; then
  # shellcheck source=./.bash_aliases
  . ~/.bash_aliases
fi
