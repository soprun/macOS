#-----------------------------------
# Глобальные определения
#-----------------------------------

# Прочитать настройки из /etc/bashrc, если таковой имеется.
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi
