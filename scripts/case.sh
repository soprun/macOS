#!/bin/bash

# здесь мы читаем в переменную $doing со стандартного ввода
read doing

case $doing in
  install )
    /usr/bin/nano # если $doing содержит 1, то запустить nano
  ;;
  2)
    /usr/bin/vi # если $doing содержит 2, то запустить vi
  ;;
  3)
    /usr/bin/emacs # если $doing содержит 3, то запустить emacs
  ;;
  4)
    exit 0
  ;;
esac
# если введено с клавиатуры то, что в case не описывается, выполнять следующее:

echo "Incorrect action entered."
exit 1


