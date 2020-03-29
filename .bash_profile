# alias other
alias ll='ls -la'

# git
alias git-log="git log --show-signature -1"
alias git-pull="git pull origin --verify-signatures"

# show all files in finder
alias fshow='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias fhide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# security gpg
export GPG_KEY_ID="C5DC44C2"
export GPG_KEY_EMAIL="develop@soprun.com"

alias gpgcopy="gpg --armor --export $GPG_KEY_EMAIL | pbcopy"
alias sshcopy='pbcopy < ~/.ssh/id_rsa'

# SSH authentication
# killall gpg-agent > /dev/null 2>&1
# killall ssh-agent > /dev/null 2>&1

pkill ssh-agent;
pkill gpg-agent;

# note: eval is used because the produced STDOUT is a bunch of ENV settings
eval $(gpg-agent --daemon --enable-ssh-support --options ~/.gnupg/gpg-agent.conf)
