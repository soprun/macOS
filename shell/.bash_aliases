alias ll="ls -lasG"
alias ls="ls -asG"

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

alias hosts="sudo code /etc/hosts"

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


# cleanupDS: recursively delete .DS_Store files
# -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# Creates a signed commit
#alias git-commit='git commit -a -S -m "commit message..."'
#alias git-signing-commit='git commit -a -S -m "signed commit message..."'

# git
#alias git-log="git log --show-signature -1"
#alias git-pull="git pull origin --verify-signatures"
#alias git-verify-master="git verify-commit master"

###############################################################################
# Aliases: Copy
###############################################################################

#alias copy-ip="get-url http://ipecho.net/plain | pbcopy"
#alias copy-uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy"
#alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
#alias copy-ssh-gpg="gpg --armor --export-ssh-key ${ID_GPG_KEY} | pbcopy;"
#alias copy-gpg="gpg --armor --export ${ID_GPG_KEY} | pbcopy;"
#alias copy-gravatar="echo 'http://www.gravatar.com/avatar/${ID_EMAIL_HASH}?size=250' | pbcopy;"



# sudo -i
# логин эмулируется.

# sudo su
# полностью выполняется логин от имени рута.
