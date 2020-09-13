###
### Default environment variables
###

###
### Set personal aliases
###

if [ -f "${HOME}/.bash_aliases" ]; then
  # shellcheck source=./.bash_aliases
  . "${HOME}/.bash_aliases"
fi

# export GPG_KEY_ID="B7502F96C5DC44C2"
# export GPG_KEY_EMAIL="mail@soprun.com"
# export GPG_KEY_FINGERPRINT=""
# export GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong

# pgp.mit.edu | keys.openpgp.org | hkps://hkps.pool.sks-keyservers.net
# ipv4.pool.sks-keyservers.net
# pgp.mit.edu
# keyserver.pgp.com
# keys.openpgp.org
# export GPG_KEY_SERVER="keys.openpgp.org"

# pkill ssh-agent;
# pkill gpg-agent;


# brew install gnupg gpg-agent pinentry-mac

# GNU Privacy Guard
export GPG_TTY=$(tty)

## SSH-agent running!
#if [[ -z ${SSH_AGENT_PID} ]]; then
#  eval $(ssh-agent -s) /usr/bin/tty >/dev/null
#fi

## GPG-agent running!
#gpg-agent --daemon --enable-ssh-support --sh --options "${HOME}/.gnupg/gpg-agent.conf" &>/dev/null

killall gpg-agent &>/dev/null
killall ssh-agent &>/dev/null
# note: eval is used because the produced STDOUT is a bunch of ENV settings
eval $(gpg-agent --daemon --enable-ssh-support)
