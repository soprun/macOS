###
### Default environment variables
###

if [ -f "${HOME}/.bashrc" ]; then
  # shellcheck source=./.bashrc
  . "${HOME}/.bashrc"
fi
