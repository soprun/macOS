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

# pgp.mit.edu | keys.openpgp.org | hkps://hkps.pool.sks-keyservers.net
# ipv4.pool.sks-keyservers.net
# pgp.mit.edu
# keyserver.pgp.com
# keys.openpgp.org
# export GPG_KEY_SERVER="keys.openpgp.org"

## SSH-agent running!
# pkill ssh-agent;
if [[ -z ${SSH_AGENT_PID} ]]; then
  eval `ssh-agent -s` /usr/bin/tty > /dev/null
fi

## GPG-agent running!
# pkill gpg-agent;
gpg-agent --daemon --enable-ssh-support --sh --options ~/.gnupg/gpg-agent.conf &>/dev/null

# Alias definitions
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

########################### END!
# pkill ssh-agent; pkill gpg-agent;
