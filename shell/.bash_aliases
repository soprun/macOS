alias ll="ls -lashG"
alias ls="ls -ashG"

#ls -lead

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

alias to-home="cd ${HOME};"
alias to-ssh="cd ${HOME}/.ssh;"
alias to-dev="cd ${HOME}/dev;"

alias hosts="sudo code /etc/hosts"

# alias edit="atom --wait"
# alias editor="vim"

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
#alias git-push="git push origin --follow-tags"
#alias git-verify-master="git verify-commit master"
#alias git-pull-verify="git pull --verify-signatures"

#alias git-tag-last="git-tag-current"
#alias git-branch-name="git-branch-current"

###############################################################################
# Aliases: Copy
###############################################################################

#alias copy-uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy"
#alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
#alias copy-ssh="gpg --armor --export-ssh-key ${ID_GPG_KEY} | pbcopy;ok!"
#alias copy-gpg="gpg --armor --export ${ID_GPG_KEY} | pbcopy;"

# GNU Privacy Guard
# alias gpg="gpg2"
# alias gpg="gpg --keyserver ${GPG_KEY_SERVER} --keyid-format ${GPG_KEY_FORMAT}"
# alias gpg="gpg --keyid-format ${GPG_KEY_FORMAT}"
# alias gibson="gpg --encrypt --sign --armor"
# alias ungibson="gpg --decrypt"

# get web server headers #
# alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
# alias headerc='curl -I --compress'

#readonly email_hash=$(email-to-hash ${ID_EMAIL})
#
#
## GNU Privacy Guard
#alias gibson="gpg2 --encrypt --sign --armor"
#alias ungibson="gpg2 --decrypt"

# sudo -i
# логин эмулируется.

# sudo su
# полностью выполняется логин от имени рута.
