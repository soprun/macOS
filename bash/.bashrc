# .bashrc runs for each new Terminal session

# environment variables
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u:\w]\\$ \[$(tput sgr0)\]"
# export EDITOR="open -enW" # open -enW | atom --wait

# default variables and identity
export ID_USER="develop"
export ID_NAME="Vladislav Soprun"
export ID_EMAIL="develop@soprun.com"
export ID_GPG_KEY="B7502F96C5DC44C2"
export ID_SSH_KEY="${HOME}/.ssh/${ID_EMAIL}"
export ID_GIT_SSH_KEY="${HOME}/.ssh/git_rsa"

# alias definitions
if [[ -r ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# GNU Privacy Guard
# SSH authentication
