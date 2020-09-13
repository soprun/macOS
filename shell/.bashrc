###
### Default environment variables
###

export LANG="en_US.UTF-8"
export CLICOLOR="1"
export EDITOR="code" # $EDITOR - текстовый редактор по умолчанию

export PATH="${PATH}:/usr/local/bin"
# chsh -s /usr/local/bin/bash

###
### set PATH so it includes user's private bin if it exists
###

if [ -d "${HOME}/bin" ]; then
  export PATH="${PATH}:${HOME}/bin"
fi

#echo $SHELL
#echo $BASH_VERSION

###
### Set personal aliases
###

if [ -f "${HOME}/.bash_aliases" ]; then
  # shellcheck source=./.bash_aliases
  . "${HOME}/.bash_aliases"
fi
