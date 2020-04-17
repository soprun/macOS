# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Default variables and identity
export ID_EMAIL="develop@soprun.com"
export ID_NAME="Vladislav Soprun"

# SSH authentication
export SSH_KEY_ID="id_rsa"
export SSH_KEY_EMAIL=${ID_EMAIL}
export SSH_KEY="${HOME}/.ssh/${SSH_KEY_ID}"
export SSH_KEY_PUBLIC="${SSH_KEY}.pub"

# GNU Privacy Guard
export GPG_KEY_ID="B7502F96C5DC44C2"
export GPG_KEY_EMAIL="mail@soprun.com"
# export GPG_KEY_FINGERPRINT=""
# export GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
# export GPG_KEY_SERVER="keys.openpgp.org" # pgp.mit.edu | keys.openpgp.org
export GPG_TTY=$(tty)

# alias gpg="gpg2 --keyserver ${GPG_KEY_SERVER} --keyid-format ${GPG_KEY_FORMAT}"
# alias gpg="gpg2 --keyid-format ${GPG_KEY_FORMAT}"
alias gpg="gpg2"

# Alias definitions
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

alias issh="ssh -t develop@34.89.252.154"
