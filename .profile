# Enable tracing
set -e

# https://natelandau.com/my-mac-osx-bash_profile/

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]] ; then
    export PATH="${HOME}/bin:${PATH}"
fi

export PATH="${HOME}/.composer/vendor/bin/:${PATH}"

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

###############################################################################
# Aliases: Copy
###############################################################################

alias copy-ip="get-url http://ipecho.net/plain | pbcopy"
alias copy-uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy"
alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
alias copy-gpg="gpg --armor --export ${ID_GPG_KEY} | pbcopy;"
alias copy-gravatar="echo 'http://www.gravatar.com/avatar/${ID_EMAIL_HASH}?size=250' | pbcopy;"
