#!/bin/bash

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
set -o errexit # Exit when simple command fails               'set -e'
# set -o errtrace # Exit on error inside any functions or subshells.
# set -o nounset  # Trigger error when expanding unset variables 'set -u'
# set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
# set -o xtrace   # Display expanded command and arguments       'set -x'

function install_bashrc() {
  printf "=>\033[0;35m Executed install .bashrc \n\033[0m"
  ln -sf "${PWD}/.bashrc" ~/.zshrc
  chmod 700 ~/.zshrc
}

function install_profile() {
  printf "=>\033[0;35m Executed install .bash_profile \n\033[0m"
  ln -sf "${PWD}/.bash_profile" ~/.profile
  chmod 700 ~/.profile
}

function install_aliases() {
  printf "=>\033[0;35m Executed install .bash_aliases \n\033[0m"
  ln -sf "${PWD}/.bash_aliases" ~/.bash_aliases
  chmod 700 ~/.bash_aliases
}

function install_bash_functions() {
  printf "=>\033[0;35m Executed install .bash_functions \n\033[0m"
#  ln -sf "${PWD}/functions" ~/.bash_functions
#  chmod 700 ~/.bash_functions

#  mkdir -p "${HOME}/bin"
#  cp "${PWD}/functions/" "${HOME}/bin/"
}

main() {
  printf "\033[0;35mThe main command is executed. \n\033[0m"

  install_bashrc
  install_profile
  install_aliases
  # install_bash_functions
}

main "$@"

###############################################################################
# Git
###############################################################################

git config --global user.name "Vladislav Soprun"
git config --global user.email "develop@soprun.com"
git config --global commit.gpgsign true
git config --global gpg.program "gpg"
git config --global user.signingkey "8120213055C84C2C3324FB08B7502F96C5DC44C2"

# git config --global --list

###############################################################################
# SSH configuration
###############################################################################

mkdir -p "${HOME}/.ssh/"

readonly ssh_config_source="${PWD}/app/ssh/config.conf"
readonly ssh_config="${HOME}/.ssh/config"

if [[ -f ${ssh_config} ]]; then
  cp "${ssh_config}" "${ssh_config}.backup"
fi

ln -sf "${ssh_config_source}" "${ssh_config}"
chmod 700 "${ssh_config}"


# composer global require hirak/prestissimo

# composer global require friendsofphp/php-cs-fixer
# composer global require nunomaduro/phpinsights
# composer global require phpmetrics/phpmetrics
# composer global require phpmd/phpmd
# composer global require phpunit/phpunit:^9.0 --update-with-dependencies


# curl -sS https://get.symfony.com/cli/installer | bash
# curl https://installer.blackfire.io/ | bash
