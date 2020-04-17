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

if [[ ! -z ${SSH_AGENT_PID:-} ]]; then
  # eval $(ssh-agent -s) > /dev/null 2>&1
  eval $(ssh-agent -s)
fi

# GNU Privacy Guard
export GPG_KEY_ID="C5DC44C2"
export GPG_KEY_ID_LONG="B7502F96C5DC44C2"
export GPG_KEY_EMAIL="mail@soprun.com"
export GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
export GPG_KEY_SERVER="hkps://keys.openpgp.org"
export GPG_TTY=$(tty)

# alias gpg="gpg --keyid-format ${GPG_KEY_FORMAT}"

# pkill ssh-agent;
# pkill gpg-agent;

#if [[ -f "${HOME}/.gpg-agent-info" ]]; then
#  . "${HOME}/.gpg-agent-info"
#  export GPG_AGENT_INFO
#  export SSH_AUTH_SOCK
#  export SSH_AGENT_PID
#fi

# note: eval is used because the produced STDOUT is a bunch of ENV settings
# eval $(gpg-agent --daemon --enable-ssh-support --options ~/.gnupg/gpg-agent.conf)
if [[ ! -z ${GPG_AGENT_INFO:-} ]]; then
  eval $(gpg-agent --daemon --enable-ssh-support)
fi

# Alias copy
alias copy-ssh="pbcopy < ${SSH_KEY_PUBLIC}"
# alias copy-gpg="gpg --armor --export ${GPG_KEY_EMAIL} | pbcopy"
alias copy-ip="curl http://ipecho.net/plain | pbcopy"

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'

## Colorize the ls output ##
alias ls='ls -G'
## Use a long listing format ##
alias ll='ls -laG'

# get web server headers #
alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

# become root #
# alias root='sudo -i'
# alias su='sudo -i'
