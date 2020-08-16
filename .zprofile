# fpath+="~/Projects/dotfiles/zshfunctions"
#chsh -s /bin/zsh
# Like bash’s .bashrc, zsh uses a dot file to store user configuration settings, .zshrc
# Similarly, you can add a .zprofile file to your home directory. .zprofile is a script that will run upon login.

# export log_level=info


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

  # ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"

  ssh-keygen -t rsa -b 4096 -N '' -f "${ID_SSH_KEY}" -C "${ID_EMAIL}"
  chmod 400 "${ID_SSH_KEY}"

  Получив пару ключей, скопируйте открытый ключ на удаленный сервер:
  ssh-copy-id username@hostname
  Введите пароль удаленного пользователя, и открытый ключ будет добавлен в authorized_keysфайл удаленного пользователя .

  После загрузки ключа вы можете войти на удаленный сервер без запроса пароля.
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
alias homestead-open='code ~/Homestead/'
alias homestead-update='cd ~/Homestead && vagrant box update && git pull origin master'

# starts and provisions the vagrant environment
alias hup='homestead up'
alias hupp='homestead up --provision --parallel --debug'

# restarts vagrant machine, loads new Vagrantfile configuration
alias hr='homestead reload'
alias hrp='homestead reload --provision'

# stops the vagrant machine
alias hdown='homestead halt'

alias hssh='homestead ssh'

# export VAGRANT_LOG=info

function homestead-reload() {
    # homestead halt
    # homestead reload --provision
    # homestead up --provision --parallel --debug
    # homestead up --provision --parallel --debug &> ${PWD}/.vagrant.log

    homestead reload --provision && homestead up --provision --parallel
}

# code/billing/web

# function hssh() {
#     ## if exists APP_DIR ...
#     ( homestead ssh -c "sudo su; cd ~/code/" && $* )
# }

function ssh-open() {
  ssh -l username $*
}
