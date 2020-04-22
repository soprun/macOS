# .bashrc runs for each new Terminal session

# environment variables
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u:\w]\\$ \[$(tput sgr0)\]"
export EDITOR="open -enW" # open -enW | atom --wait

# alias definitions
if [[ -r ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# default variables and identity

# export ID_USER="develop"
# export ID_NAME="Vladislav Soprun"
# export ID_EMAIL="develop@soprun.com"

# GNU Privacy Guard
# SSH authentication
