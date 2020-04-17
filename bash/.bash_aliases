# some more ls aliases
alias ls='ls -G'
alias ll='ls -laG'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'

# alias copy
alias copy-ssh="pbcopy < ${SSH_KEY_PUBLIC}"
alias copy-gpg="gpg --armor --export ${GPG_KEY_ID} | pbcopy;"
alias copy-ip="curl http://ipecho.net/plain | pbcopy;"

