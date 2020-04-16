
# var
aliases_file="${HOME}/.bash_aliases"

# Source global definitions
if [[ -f ${aliases_file} ]]; then
  source ${aliases_file};
fi

# SSH authentication
if [[ ! -z ${SSH_AGENT_PID:-} ]]; then
  eval $(ssh-agent -s) > /dev/null 2>&1
fi;
