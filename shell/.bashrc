# Поместите в .bashrc файл команды, которые должны запускаться каждый раз при запуске новой оболочки.
# Сюда входят ваши псевдонимы и функции, пользовательские подсказки, настройки истории и т.д.

#if [ -n "$BASH" ] ;then
#    lines to ignore by zsh
#fi

if [ -f "${HOME}/.bash_aliases" ]; then
  # shellcheck source=./.bash_aliases
  . "${HOME}/.bash_aliases"
fi
