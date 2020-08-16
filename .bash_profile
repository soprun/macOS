# shellcheck shell=bash

# Используйте .bash_profile для запуска команд, которые должны выполняться только один раз,
# например для настройки $PATH переменной среды.

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]]; then
  export PATH="${HOME}/bin:${PATH}"
fi

###############################################################################
# Configuration identity variables defaults...
###############################################################################

# https://en.gravatar.com/site/implement/hash/
function email_to_hash {
    echo -n $1 | tr '[A-Z]' '[a-z]' | md5
}

export ID_NAME='Vladislav Soprun'
export ID_USER='develop'
export ID_EMAIL='mail@soprun.com'
export ID_TO_HASH="$(email_to_hash ${ID_EMAIL})"

export ID_GPG_KEY="8120213055C84C2C3324FB08B7502F96C5DC44C2"
# export ID_SSH_KEY="${HOME}/.ssh/${ID_EMAIL}"
export ID_SSH_KEY="${HOME}/.ssh/id_rsa"

###############################################################################
# Homestead
###############################################################################

alias hosts-edit='code /etc/hosts'

###############################################################################
# edit
###############################################################################

alias edit-hosts="hosts-edit"



###############################################################################
# Autoload functions
###############################################################################

if [[ -f ~/.bashrc ]]; then
  # shellcheck source=./.bashrc
  . ~/.bashrc
fi

###############################################################################
# Autoload functions
###############################################################################


# curl_timeout=10

# get-url https://soprun.com
function get-url() {
  ( curl -LS --ssl-reqd --max-time 20 --url $* )
}

# get-url-head https://soprun.com
function get-url-head() {
  ( get-url $* --head )
}

# get-url-head https://keybase.io/soprun/pgp_keys.asc
function gpg-url-import() {
  ( curl -sSL --ssl-reqd --url $* | gpg --import -)
}

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
alias hupp='homestead up --provision --color --parallel'

# restarts vagrant machine, loads new Vagrantfile configuration
alias hr='homestead reload --provision'

# stops the vagrant machine
alias hdown='homestead halt'

alias hssh='homestead ssh'

alias hrf='homestead reload && homestead up --provision --color --parallel'

