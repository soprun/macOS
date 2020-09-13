###
### Default environment variables
###

echo "shell - .bashrc: '${SHELL}'"
echo "version - .bashrc: '${BASH_VERSION}'"

###
### Set personal aliases
###

if [ -f "${HOME}/.bash_aliases" ]; then
  # shellcheck source=./.bash_aliases
  . "${HOME}/.bash_aliases"
fi
