#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034

#######################################################################
# Load environment variables
#######################################################################

for file in ${HOME}/.{env,env.local,bash_aliases}; do
  # shellcheck source=./../.env
  # shellcheck source=./.bash_aliases
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -z "$SHELL_HOME" ]; then
  printf "\033[0;31m[error]\033[0m: %s\\n" "An error occurred, the value of the variable SHELL_HOME was not loaded!"
  exit 1
fi

#######################################################################
# Auto loading bin
#######################################################################

PATH="$SHELL_HOME:$PATH"

for dir in "$SHELL_HOME"/*; do
  if [ -d "$dir" ]; then
    PATH="$dir:$PATH"
  fi
done
unset dir

#######################################################################
# Export environment variables
#######################################################################

### Shell environment variables

export SHELL_HOME
export SHELL_PROFILE_SOURCE
#export SHELL_PROFILE_DEBUG
#export SHELL_PROFILE_LOG

### Identity environment variables

export ID_NAME
export ID_USER
export ID_EMAIL
export ID_GPG_KEY

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
# export BUILDX_NO_DEFAULT_LOAD=false
export BUILDKIT_PROGRESS

#export DOCKER_CONTENT_TRUST
#export DOCKER_CONTENT_TRUST_SERVER

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

# shellcheck disable=SC2016
PROMPT='%{%f%b%k%}$(build_prompt)'

# GPG Agent
#GPG_TTY="$(tty)"
#export GPG_TTY
#unset SSH_AGENT_PID
#SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#export SSH_AUTH_SOCK

#export EDITOR='vim'
#export EDITOR='phpstorm'
export EDITOR='code'
