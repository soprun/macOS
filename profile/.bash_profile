# shellcheck shell=bash

#######################################################################
# Load environment variables
#######################################################################

for file in ${HOME}/.{env,env.local,bash_aliases}; do
  # shellcheck source=./../.env
  # shellcheck source=./.bash_aliases
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -z $SHELL_BIN ]; then
  printf "\033[0;31m[error]\033[0m: %s\\n" "An error occurred, the value of the variable SHELL_BIN was not loaded!"
  exit 1
fi

#######################################################################
# Auto loading bin
#######################################################################

PATH="$SHELL_BIN:$PATH"

for dir in $SHELL_BIN/*; do
  if [ -d "$dir" ]; then
    PATH="$dir:$PATH"
  fi
done
unset dir

#######################################################################
# Export environment variables
#######################################################################

### Shell environment variables

export SHELL_BIN
export SHELL_PROFILE_SOURCE
#export SHELL_PROFILE_DEBUG
#export SHELL_PROFILE_LOG

### Identity environment variables

#export ID_NAME
#export ID_USER
#export ID_EMAIL
#export ID_GPG_KEY

### Git credentials

#export GIT_NAME
#export GIT_EMAIL
#export GIT_GPG_KEY
#export GIT_GPG_SIGN
#export GIT_GPG_PROGRAM
#export GIT_EDITOR
#export GIT_SSL_NO_VERIFY=true

### Composer environment variables

export COMPOSER_HOME
export COMPOSER_CACHE_DIR
export COMPOSER_MEMORY_LIMIT
export COMPOSER_ALLOW_SUPERUSER
export PATH="${COMPOSER_HOME}/vendor/bin:$PATH"

### Docker environment variables

export DOCKER_BUILDKIT
export DOCKER_CLI_EXPERIMENTAL
export COMPOSE_DOCKER_CLI_BUILD
export BUILDX_NO_DEFAULT_LOAD=false
