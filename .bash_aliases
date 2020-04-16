## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'

alias c='clear'

## Colorize the ls output ##
alias ls='ls -G'
## Use a long listing format ##
alias ll='ls -la'
## Show hidden files ##
# alias l.='ls -d .*'

##########



# get web server headers #
# alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
# alias headerc='curl -I --compress'






# become root #
alias root='sudo -i'
alias su='sudo -i'


# git
# alias git-log="git log --show-signature -1"
# alias git-pull="git pull origin --verify-signatures"

# show all files in finder


# AppleScript

function restartFinder() {
  osascript -e 'quit app "Finder"';
  # killall Finder;
  echo 'Finder was restarted!';
}

alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles -bool true; restartFinder'
alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles -bool false; restartFinder'

# security gpg
# export GPG_KEY_ID="C5DC44C2"
# export GPG_KEY_EMAIL="develop@soprun.com"

# SSH authentication
# killall gpg-agent > /dev/null 2>&1
# killall ssh-agent > /dev/null 2>&1

# pkill ssh-agent;
# pkill gpg-agent;

# note: eval is used because the produced STDOUT is a bunch of ENV settings
# eval $(gpg-agent --daemon --enable-ssh-support --options ~/.gnupg/gpg-agent.conf)

# Alias copy
# alias copy-uuid="uuidgen | awk '{print tolower(\$0)}' | pbcopy; pbpaste;"
# alias copy-gpg="gpg --armor --export ${GPG_KEY_EMAIL} | pbcopy"
alias copy-ssh="pbcopy < ${SSH_KEY_PUBLIC}";
