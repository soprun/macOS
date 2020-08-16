# shellcheck shell=bash

# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]]; then
  export PATH="${HOME}/bin:${PATH}"
fi

###############################################################################
# Autoload functions
###############################################################################

export FPATH="${HOME}/.bash_functions:${FPATH}"

# alias autoload='typeset -fu'

if [[ -f ~/.bashrc ]]; then
  # shellcheck source=./.bashrc
  . ~/.bashrc
fi
