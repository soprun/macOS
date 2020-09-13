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

###
### GPG-agent running!
###

GPG_TTY=$(tty)
export GPG_TTY

# note: eval is used because the produced STDOUT is a bunch of ENV settings
eval $(gpg-agent --daemon --enable-ssh-support >/dev/null 2>/dev/null)
# FIXME: gpg-agent: a gpg-agent is already running - not starting a new one

###
### SSH-agent running!
###

if [ -z ${SSH_AGENT_PID} ]; then
  eval $(ssh-agent -s) /usr/bin/tty >/dev/null
fi

#killall gpg-agent &>/dev/null
#killall ssh-agent &>/dev/null
