# .bash_aliases
alias ls='ls -G'
alias ll='ls -laG'

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

# show all files in finder
# alias fshow='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# alias fhide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
# alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles -bool true;killall Finder;'
# alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles -bool false;killall Finder'

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


# alias hosts=""