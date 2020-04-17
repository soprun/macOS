# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Default variables and identity
export ID_USER="develop"
export ID_NAME="Vladislav Soprun"
export ID_EMAIL="develop@soprun.com"

# Default SSH authentication
export SSH_KEY_ID="${HOME}/.ssh/id_rsa"

# declare -r ssh_key_default_id="develop"
# export SSH_KEY_NAME="id_rsa"
# export SSH_KEY_EMAIL="${ID_USER}"
# export SSH_KEY_PUBLIC="${SSH_KEY}.pub"

# GNU Privacy Guard
export GPG_TTY=$(tty)
export GPG_KEY_ID="B7502F96C5DC44C2"
# export GPG_KEY_EMAIL="mail@soprun.com"
# export GPG_KEY_FINGERPRINT=""
# export GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
# export GPG_KEY_SERVER="keys.openpgp.org" # pgp.mit.edu | keys.openpgp.org

# GPG agent start!
if [[ -z ${SSH_AUTH_SOCK} ]]; then
  eval "$(gpg-agent --daemon --enable-ssh-support -s)"
fi

# Alias definitions
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

########################### END!
# pkill ssh-agent; pkill gpg-agent;

instance_ip=""

alias issh="ssh -t develop@soprun.com"
alias bssh="issh 'sudo su - bitnami'"

# ssh -N -L SOURCE-PORT:127.0.0.1:DESTINATION-PORT -i KEYFILE bitnami@34.89.236.1
# ssh -N -L 8888:127.0.0.1:80 -i ${SSH_KEY_ID} develop@34.89.252.154

