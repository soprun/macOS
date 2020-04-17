# Default variables: identity, security, gpg
id_email="develop@soprun.com"
# id_email_public="mail@soprun.com"
id_name="Vladislav Soprun"

# SSH authentication
export SSH_KEY_ID="id_rsa"
export SSH_KEY_EMAIL=${id_email}
export SSH_KEY="${HOME}/.ssh/${SSH_KEY_ID}"
export SSH_KEY_PUBLIC="${SSH_KEY}.pub"

# GNU Privacy Guard
export GPG_KEY_ID="B7502F96C5DC44C2"
export GPG_KEY_FINGERPRINT=""
export GPG_KEY_EMAIL="mail@soprun.com"
export GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
# export GPG_KEY_SERVER="keys.openpgp.org" # pgp.mit.edu | keys.openpgp.org
export GPG_TTY=$(tty)

# alias gpg="gpg2 --keyserver ${GPG_KEY_SERVER} --keyid-format ${GPG_KEY_FORMAT}"
# alias gpg="gpg2 --keyid-format ${GPG_KEY_FORMAT}"
alias gpg="gpg2"

# Alias copy
alias copy-ssh="pbcopy < ${SSH_KEY_PUBLIC};"
alias copy-gpg="gpg --armor --export ${GPG_KEY_ID} | pbcopy;"
alias copy-ip="curl http://ipecho.net/plain | pbcopy;"

## a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ls='ls -G'
alias ll='ls -laG'

# pkill ssh-agent; pkill gpg-agent;
if [[ -z ${SSH_AUTH_SOCK} ]]; then
  # GPG agent restarted!
  eval $(gpg-agent --daemon --enable-ssh-support --verbose)
fi
