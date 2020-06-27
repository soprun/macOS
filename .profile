# Enable tracing
set -e
# https://natelandau.com/my-mac-osx-bash_profile/

# https://en.gravatar.com/site/implement/hash/
function email_to_hash {
    echo -n $1 | tr '[A-Z]' '[a-z]' | md5
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

# docker-compose up --build --detach
# docker-compose up --build --detach --force-recreate --remove-orphans

# docker-compose build --force-rm

# Stop one or more running containers
# docker stop $(docker ps --all --quiet)

# Remove one or more containers
# docker rm $(docker ps --all --quiet) --volumes

# Remove one or more images
# docker rmi $(docker images --all --quiet) --force

# Creates a signed commit
alias git-commit='git commit -a -S -m "commit message..."'
alias git-signing-commit='git commit -a -S -m "signed commit message..."'

# git
alias git-log="git log --show-signature -1"
alias git-pull="git pull origin --verify-signatures"

alias hosts="sudo vim /etc/hosts"

