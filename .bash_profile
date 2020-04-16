if [[ -e $HOME/.bash_aliases ]]; then
  source "${HOME}/.bash_aliases"
fi


# alias other
# alias ll='ls -larG --color=auto'

# alias ls='ls -G'
# alias ll='ls -lG'

# alias ls='ls -aF --color=always'
# alias ll='ls -l'

# git
# alias git-log="git log --show-signature -1"
# alias git-pull="git pull origin --verify-signatures"

# show all files in finder
#alias fshow='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder;'
#alias fhide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder;'

# security gpg
# export GPG_KEY_ID="C5DC44C2"
# export GPG_KEY_EMAIL="develop@soprun.com"

# alias copy-gpg="gpg --armor --export ${GPG_KEY_EMAIL} | pbcopy"
# alias copy-ssh='pbcopy < ~/.ssh/id_rsa'

# SSH authentication
# killall gpg-agent > /dev/null 2>&1
# killall ssh-agent > /dev/null 2>&1

# pkill ssh-agent;
# pkill gpg-agent;

# note: eval is used because the produced STDOUT is a bunch of ENV settings
# eval $(gpg-agent --daemon --enable-ssh-support --options ~/.gnupg/gpg-agent.conf)

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/soprun/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/soprun/google-cloud-sdk/path.zsh.inc'; fi

## The next line enables shell command completion for gcloud.
#if [ -f '/Users/soprun/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/soprun/google-cloud-sdk/completion.zsh.inc'; fi
