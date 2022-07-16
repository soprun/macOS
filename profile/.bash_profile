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

export CLICOLOR

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

export GIT_NAME
export GIT_EMAIL
export GIT_GPG_KEY

# git-receive-pack
# https://runebook.dev/ru/docs/git/git-receive-pack
#export GIT_PUSH_CERT_SIGNER="${GIT_NAME} <${GIT_EMAIL}>"
#export GIT_PUSH_CERT_KEY="${ID_GPG_KEY}"
#export GIT_PUSH_CERT_STATUS="${ID_GPG_KEY}"
#export GIT_PUSH_CERT_NONCE="nonce"

export GIT_PUSH_CERT
export GIT_PUSH_CERT_SIGNER="Vladislav Soprun <develop@soprun.com>"
export GIT_PUSH_CERT_KEY="B7502F96C5DC44C2"

# GitHub credentials
######################################################################

export GITHUB_USER
export GITHUB_TOKEN

# GitLab credentials:
######################################################################

export GITLAB_USER
export GITLAB_TOKEN

### Composer environment variables

export COMPOSER_HOME
export COMPOSER_CACHE_DIR
export COMPOSER_MEMORY_LIMIT
export COMPOSER_ALLOW_SUPERUSER
export PATH="${COMPOSER_HOME}/vendor/bin:$PATH"

### Docker environment variables

export DOCKER_HOST=unix:///var/run/docker.sock
export DOCKER_BUILDKIT
export DOCKER_CLI_EXPERIMENTAL
export COMPOSE_DOCKER_CLI_BUILD
# export BUILDX_NO_DEFAULT_LOAD=false
export BUILDKIT_PROGRESS

export BLACKFIRE_CLIENT_ID
export BLACKFIRE_CLIENT_TOKEN
export BLACKFIRE_SERVER_ID
export BLACKFIRE_SERVER_TOKEN

export BLACKFIRE_AGENT_SOCKET="unix:///opt/homebrew/var/run/blackfire-agent.sock"
# export BLACKFIRE_SOCKET="unix:///opt/homebrew/var/run/blackfire-agent.sock"

# 1: error, 2: warning, 3: info, 4: debug
export BLACKFIRE_LOG_LEVEL=1

# https://earthly.dev/blog/what-is-buildkit-and-what-can-i-do-with-it/#buildkitd
# https://github.com/moby/buildkit#containerizing-buildkit
# export BUILDKIT_HOST=docker-container://buildkit

# https://hub.docker.com/r/moby/buildkit
# To run daemon in a container:

# docker run -d --name buildkit --privileged moby/buildkit:latest
# export BUILDKIT_HOST=docker-container://buildkit
# buildctl build --help

# docker run -d --name buildkit --privileged moby/buildkit:latest

#docker run -it --rm  --privileged \
#    --entrypoint buildctl-daemonless.sh \
#    moby/buildkit:master \
#        build \
#        --frontend dockerfile.v0 \
#        --local context=/tmp/work \
#        --local dockerfile=/tmp/work

#export DOCKER_CONTENT_TRUST
#export DOCKER_CONTENT_TRUST_SERVER

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

# shellcheck disable=SC2016
# PROMPT='%{%f%b%k%}$(build_prompt)'

# GPG Agent
GPG_TTY="$(tty)"
export GPG_TTY

unset SSH_AGENT_PID
SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export SSH_AUTH_SOCK

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setup the gpg-agent for SSH authentication
# see: https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3#setup-the-gpg-agent-for-ssh-authentication


# export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock


