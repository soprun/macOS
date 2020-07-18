# Enable tracing
set -e

# https://natelandau.com/my-mac-osx-bash_profile/

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]] ; then
    export PATH="${HOME}/bin:${PATH}"
fi

export PATH="${HOME}/.composer/vendor/bin/:${PATH}"

export PATH="/usr/local/bin/php:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

export LDFLAGS="-L/usr/local/opt/php@7.2/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.2/include"

# ln -s /usr/local/opt/php@7.2/bin /usr/local/bin/php

# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"
# export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

# export PHP_INI_PATH="/usr/local/etc/php/7.4/php.ini"
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# export PATH="/usr/local/opt/php/bin:$PATH"
# export PATH="/usr/local/opt/php/sbin:$PATH"

# export PATH="/usr/local/opt/php@7.2/bin:$PATH"
# export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

# For compilers to find zlib you may need to set:
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# export PATH="/usr/local/opt/php@7.1/bin:$PATH"
# export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# export LDFLAGS="-L/usr/local/opt/php@7.1/lib"
# export CPPFLAGS="-I/usr/local/opt/php@7.1/include"

# If you need to have icu4c first in your PATH run:
# echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
# echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

# For compilers to find icu4c you may need to set:
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

###############################################################################
# Configuration identity variables defaults...
###############################################################################

# https://en.gravatar.com/site/implement/hash/
function email_to_hash {
    echo -n $1 | tr '[A-Z]' '[a-z]' | md5
}

# get-url https://soprun.com
function get-url() {
  ( curl -LS --ssl-reqd --url $* )
}

# get-url-head https://soprun.com
function get-url-head() {
  ( get-url $* --head )
}

# get-url-head https://keybase.io/soprun/pgp_keys.asc
function gpg-url-import() {
  ( curl -sSL --ssl-reqd --url $* | gpg --import -)
}

###############################################################################
# Configuration identity variables defaults...
###############################################################################

export ID_USER="develop"
export ID_NAME="Vladislav Soprun"
export ID_EMAIL="develop@soprun.com"
export ID_EMAIL_HASH=$(email_to_hash ${ID_EMAIL})
export ID_GPG_KEY="8120213055C84C2C3324FB08B7502F96C5DC44C2"
export ID_SSH_KEY="${HOME}/.ssh/${ID_EMAIL_HASH}"

###############################################################################
# Aliases
###############################################################################

alias ls='ls -G'
alias ll='ls -laG'

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

# alias edit="atom --wait"
alias editor="vim"
alias hosts="sudo vim /etc/hosts"

# Creates a signed commit
# alias git-commit='git commit -a -S -m "commit message..."'
# alias git-signing-commit='git commit -a -S -m "signed commit message..."'

# git
# alias git-log="git log --show-signature -1"
# alias git-pull="git pull origin --verify-signatures"

# git config --local gpg.x509.program smimesign
# git config --local gpg.format x509

# git config --global gpg.program smimesign
# git config --global gpg.program gpg2
# git config --global commit.gpgsign false
# git config --global user.signingkey ${GPG_KEY_FINGERPRINT}


# alias hosts=""

# ---------------------------------------
# SYSTEMS OPERATIONS & INFORMATION
# ---------------------------------------

# cleanupDS: recursively delete .DS_Store files
# -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# Creates a signed commit
alias git-commit='git commit -a -S -m "commit message..."'
alias git-signing-commit='git commit -a -S -m "signed commit message..."'

# git
alias git-log="git log --show-signature -1"
alias git-pull="git pull origin --verify-signatures"
alias git-verify-master="git verify-commit master"

###############################################################################
# Aliases: Docker
###############################################################################

# export DOCKER_HOST=unix:///var/run/docker.sock

function docker-up() {
  echo 'Building and start containers...'
  docker-compose up --build --detach
}

function docker-up-force() {
  echo 'Building and start containers...'
  docker-compose up --build --detach --force-recreate --remove-orphans
}

function docker-build() {
  echo 'Building now...'
  docker-compose build --force-rm
}

function docker-down() {
  echo 'Stopping docker...'

  # Stop one or more running containers
  docker stop $(docker ps --all --quiet)
}

function docker-remove() {
  docker-down

  # Remove one or more containers
  docker rm $(docker ps --all --quiet) --volumes
  # Remove one or more images
  docker rmi $(docker images --all --quiet) --force
}

# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/soprun/.docker/machine/machines/default"
# export DOCKER_MACHINE_NAME="default"

# Run this command to configure your shell: 
# eval $(docker-machine env)

###############################################################################
# Aliases: Copy
###############################################################################

alias copy-ip="get-url http://ipecho.net/plain | pbcopy"
alias copy-uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy"
alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
alias copy-gpg="gpg --armor --export ${ID_GPG_KEY} | pbcopy;"
alias copy-gravatar="echo 'http://www.gravatar.com/avatar/${ID_EMAIL_HASH}?size=250' | pbcopy;"


# sudo -i
# логин эмулируется.

# sudo su
# полностью выполняется логин от имени рута.
