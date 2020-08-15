# fpath+="~/Projects/dotfiles/zshfunctions"
#chsh -s /bin/zsh
# Like bash’s .bashrc, zsh uses a dot file to store user configuration settings, .zshrc
# Similarly, you can add a .zprofile file to your home directory. .zprofile is a script that will run upon login.

# include .bashrc if it exists
if [ -e ~/.zshrc ]; then
    . ~/.zshrc
fi

###############################################################################
# Autoload
###############################################################################

# fpath=(~/my-zsh-functions $fpath)
# autoload -Uz fn
# fn

###############################################################################
# Generating keys for SSH authentication
###############################################################################

if [[ ! -f ${ID_SSH_KEY} ]]; then
  ssh-keygen -t rsa -b 4096 -N '' -f "${ID_SSH_KEY}" -C "${ID_EMAIL}"
  chmod 400 "${ID_SSH_KEY}"
fi

###############################################################################
# SSH alias
###############################################################################

alias copy-ssh="pbcopy < ${ID_SSH_KEY}.pub"
alias copy-ssh-gpg="gpg --armor --export-ssh-key ${ID_GPG_KEY} | pbcopy;"

###############################################################################
# Homestead
###############################################################################

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# Homestead
alias homestead-edit='code ~/Homestead/Homestead.yaml'
alias homestead-update='cd ~/Homestead && vagrant box update && git pull origin master'

# starts and provisions the vagrant environment
alias hup='homestead up'
alias hupp='homestead up --provision --parallel'

# restarts vagrant machine, loads new Vagrantfile configuration
alias hr='homestead reload'
alias hrp='homestead reload --provision'

# stops the vagrant machine
alias hdown='homestead halt'

alias hssh='homestead ssh'
