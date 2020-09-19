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

#gpgconf --launch gpg-agent
#gpgconf --kill gpg-agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

###
### SSH-agent running!
### killall ssh-agent &>/dev/null

if [ -z "$SSH_AGENT_PID" ]; then
  eval $(ssh-agent -s) /usr/bin/tty >/dev/null
fi

###
### GPG-agent running!
### killall gpg-agent &>/dev/null

# Start gpg-agent if it's not running
if [ -z "$(pidof gpg-agent 2>/dev/null)" ]; then
  gpg-agent --daemon --enable-ssh-support --sh --options "$HOME/.gnupg/gpg-agent.conf" >"$HOME/.gnupg/env"
fi

# Import various environment variables from the agent.
if [ -f "$HOME/.gnupg/env" ]; then
  # shellcheck source=
  . "$HOME/.gnupg/env"
fi
