# shellcheck shell=bash

# Long format list
alias ll="ls -lasG"

# Print my public IP
# alias myip='curl ipinfo.io/ip'

alias copy-ip="get-url http://ipecho.net/plain | pbcopy"


alias edit-hosts='sudo code /etc/hosts'
alias edit-homestead='code ~/Homestead/Homestead.yaml'


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




alias md5='md5 -r'
alias md5sum='md5 -r'

###############################################################################
# PHP Xdebug
###############################################################################

# alias xon="sh enabled-xdebug.sh"
# alias xoff="sh disable-xdebug.sh"



###############################################################################
# Aliases: Copy
###############################################################################

alias copy-ip="get-url http://ipecho.net/plain | pbcopy"
alias copy-uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy"
alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
alias copy-ssh-gpg="gpg --armor --export-ssh-key ${ID_GPG_KEY} | pbcopy;"
alias copy-gpg="gpg --armor --export ${ID_GPG_KEY} | pbcopy;"
alias copy-gravatar="echo -n 'http://www.gravatar.com/avatar/${ID_EMAIL_HASH}?size=250&d=404' | pbcopy;"

#######################################
# RabbitMQ

# sudo -i
# логин эмулируется.

# sudo su
# полностью выполняется логин от имени рута.