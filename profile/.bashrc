# .bashrc runs for each new Terminal session

# set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
  export PATH="$HOME/bin:$PATH"
fi

# alias definitions
if [[ -r ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# https://en.gravatar.com/site/implement/hash/
function email_to_hash {
    echo -n $1 | tr '[A-Z]' '[a-z]' | md5
}

# default variables and identity
export ID_USER="develop"
export ID_NAME="Vladislav Soprun"
export ID_EMAIL="develop@soprun.com"
export ID_TO_HASH="$(email_to_hash ${ID_EMAIL})"

export ID_GPG_KEY="0x8120213055C84C2C3324FB08B7502F96C5DC44C2"
export ID_SSH_KEY="${HOME}/.ssh/${ID_TO_HASH}"

alias copy-ip="curl http://ipecho.net/plain | pbcopy"
alias copy-uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy"
alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
alias copy-gpg="gpg --armor --export ${ID_GPG_KEY} | pbcopy"
alias copy-gravatar="echo http://www.gravatar.com/avatar/${ID_TO_HASH}?size=250 | pbcopy;"

# get-url https://soprun.com
function get-url() {
  ( curl -LS --ssl-reqd --url $* )
}

# get-url-head https://soprun.com
function get-url-head() {
  ( get-url $* --head )
}

# get-url-head https://keybase.io/soprun/pgp_keys.asc
function gpg-url-import() {
  ( curl -sSL --ssl-reqd --url $* | gpg --import -)
}

# curl -ILS --ssl-reqd --url 'https://soprun.com'
# curl -ILS 'https://keys.openpgp.org/vks/v1/by-fingerprint/8120213055C84C2C3324FB08B7502F96C5DC44C2'

# pkill ssh-agent;
# pkill gpg-agent;

# SSH-agent running!
if [[ -z ${SSH_AGENT_PID} ]]; then
  eval `ssh-agent -s` /usr/bin/tty > /dev/null
fi

# GNU Privacy Guard
export GPG_TTY=$(tty)
export GPG_KEY_FORMAT="0xlong" # short, 0xshort or long, 0xlong

if [[ -z ${SSH_AUTH_SOCK} ]]; then
  # GPG agent restarted!
  eval $(gpg-agent --daemon --enable-ssh-support --sh --options ~/.gnupg/gpg-agent.conf) &>/dev/null
fi




# alias gibson="gpg2 --encrypt --sign --armor"
# alias ungibson="gpg2 --decrypt"

# gpg --fingerprint ${ID_GPG_KEY}
# gpg --edit-key ${ID_GPG_KEY}
