if [[ "$SHELL" = "/bin/bash" ]]; then
  . ~/.bashrc
fi

# Default variables: identity, security, gpg
id_email="develop@soprun.com"
# id_email_public="mail@soprun.com"
id_name="Vladislav Soprun"

# SSH authentication
export SSH_KEY_ID="id_rsa"
export SSH_KEY_EMAIL=${id_email}
export SSH_KEY="${HOME}/.ssh/${SSH_KEY_ID}"
export SSH_KEY_PUBLIC="${SSH_KEY}.pub"
export SSH_KEY_PASSPHRASE=""

if [[ ! -z ${SSH_AGENT_PID:-} ]]; then
  # eval $(ssh-agent -s) > /dev/null 2>&1
  eval $(ssh-agent -s)
fi

# GNU Privacy Guard
export GPG_KEY_ID="B7502F96C5DC44C2"
export GPG_KEY_EMAIL="mail@soprun.com"

export GPG_TTY=$(tty)

# pkill ssh-agent;
# pkill gpg-agent;

# note: eval is used because the produced STDOUT is a bunch of ENV settings
# eval $(gpg-agent --daemon --enable-ssh-support --options ~/.gnupg/gpg-agent.conf)

# Alias copy
alias copy-ssh="pbcopy < ${SSH_KEY_PUBLIC}"
alias copy-gpg="gpg --armor --export ${GPG_KEY_EMAIL} | pbcopy"
alias copy-ip="curl http://ipecho.net/plain | pbcopy"
