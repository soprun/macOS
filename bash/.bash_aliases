# some more ls aliases
alias ls='ls -G'
alias ll='ls -laG'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'

# GNU Privacy Guard
alias gpg="gpg2"
# alias gpg="gpg --keyserver ${GPG_KEY_SERVER} --keyid-format ${GPG_KEY_FORMAT}"
# alias gpg="gpg --keyid-format ${GPG_KEY_FORMAT}"

# alias copy
alias copy-ssh="pbcopy < ${SSH_KEY_ID}.pub"
alias copy-gpg="gpg --armor --export ${GPG_KEY_ID} | pbcopy;"
alias copy-ip="curl http://ipecho.net/plain | pbcopy;"

# get web server headers #
# alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
# alias headerc='curl -I --compress'
