#!/bin/bash

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
set -o errexit  # Exit when simple command fails               'set -e'
# set -o errtrace # Exit on error inside any functions or subshells.
# set -o nounset  # Trigger error when expanding unset variables 'set -u'
# set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
# set -o xtrace   # Display expanded command and arguments       'set -x'

readonly zshrc_source="${PWD}/.zshrc"
readonly zshrc="${HOME}/.zshrc"

if [[ -f ${zshrc} ]]; then
  cp "${zshrc}" "${zshrc}.backup"
fi

ln -sf "${zshrc_source}" "${zshrc}"
chmod 700 "${zshrc}"

readonly zprofile_source="${PWD}/.zprofile"
readonly zprofile="${HOME}/.zprofile"

if [[ -f ${zprofile} ]]; then
  cp "${zprofile}" "${zprofile}.backup"
fi

ln -sf "${zprofile_source}" "${zprofile}"
chmod 700 "${zprofile}"

readonly bash_aliases_source="${PWD}/.bash_aliases"
readonly bash_aliases="${HOME}/.bash_aliases"

if [[ -f ${bash_aliases} ]]; then
  cp "${bash_aliases}" "${bash_aliases}.backup"
fi

ln -sf "${bash_aliases_source}" "${bash_aliases}"
chmod 700 "${bash_aliases}"

###############################################################################
# Functions
###############################################################################

mkdir -p "${HOME}/.config/zsh/functions"
ln -sf "${PWD}/functions" "${HOME}/.config/zsh/functions"

###############################################################################
# Git
###############################################################################

git config --global user.name "Vladislav Soprun"
git config --global user.email "develop@soprun.com"
git config --global commit.gpgsign true
git config --global gpg.program "gpg"
git config --global user.signingkey "8120213055C84C2C3324FB08B7502F96C5DC44C2"

# git config --global --list
