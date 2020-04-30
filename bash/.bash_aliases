# Aliases
alias ls='ls -G'
alias ll='ls -laG'

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

alias edit="atom --wait"
# alias editor="viv"

# Creates a signed commit
alias git-commit='git commit -a -S -m "commit message..."'
alias git-signing-commit='git commit -a -S -m "signed commit message..."'

# git
alias git-log="git log --show-signature -1"
alias git-pull="git pull origin --verify-signatures"

# git config --global user.email "your_email"
# git config --global user.name "your_Git_user_name"
# git config --global core.editor "vim"


# show all files in finder
# alias fshow='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# alias fhide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles -bool true;killall Finder;'
alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles -bool false;killall Finder'
