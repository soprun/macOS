#!/bin/bash

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
set -o errexit  # Exit when simple command fails               'set -e'
set -o errtrace # Exit on error inside any functions or subshells.
set -o nounset  # Trigger error when expanding unset variables 'set -u'
set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
#set -o xtrace   # Display expanded command and arguments       'set -x'

readonly bash_profile_source="${PWD}/.bash_profile"
readonly bash_profile="${HOME}/.bash_profile"

readonly bash_aliases_source="${PWD}/.bash_aliases"
readonly bash_aliases="${HOME}/.bash_aliases"

readonly zshrc_source="${PWD}/.zshrc"
readonly zshrc="${HOME}/.zshrc"

# readonly text_normal='\033[0m';
# readonly text_success='\033[0;32m';
# readonly text_error='\033[0;31m';

if [[ -f ${bash_profile} ]]; then
  cp "${bash_profile}" "${bash_profile}.backup"
fi

ln -sf "${bash_profile_source}" "${bash_profile}"
chmod 700 "${bash_profile}"

if [[ -f ${bash_aliases} ]]; then
  cp "${bash_aliases}" "${bash_aliases}.backup"
fi

ln -sf "${bash_aliases_source}" "${bash_aliases}"
chmod 700 "${bash_aliases}"

if [[ -f ${zshrc} ]]; then
  cp "${zshrc}" "${zshrc}.backup"
fi
ln -sf "${zshrc_source}" "${zshrc}"
chmod 700 "${zshrc}"


echo -e "=>\033[0;32m Create ${bash_profile}.backup 💾\033[0m"
echo -e "=>\033[0;31m Set permissions symbolic value 🔐 \033[0m"
echo -e "=>\033[0;30m Created a link to profile file 🔗 \033[0m"

exit 0

echo "Creates a link to the profile file..."
ln -sf "${PWD}/.bash_profile" "${HOME}/.bash_profile"
chmod 700 "${HOME}/.bash_profile"

echo "Creates a link to the git config file..."
ln -sf "$PWD/app/git/config.conf" ~/.gitconfig
chmod 700 ~/.gitconfig

echo "Creates a link to the SSH authentication config file..."
ln -sf "$PWD/app/ssh/config.conf" ~/.ssh/config
chmod 700 ~/.ssh/config

./set-defaults.sh

if [[ ! -f ${ID_SSH_KEY} ]]; then
  echo "Generating key: ${ID_EMAIL_HASH}"

  ssh-keygen -t rsa -b 4096 -N '' -f ${ID_SSH_KEY} -C ${ID_EMAIL}
  chmod 400 ${ID_SSH_KEY}
fi

# gpg --fingerprint ${ID_GPG_KEY}

killall Finder
#pkill ssh-agent;
#pkill gpg-agent;

# @todo: add composer

echo "You've successfully copy bash profiler."

# @todo: add install php

# php --ri blackfire

# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# brew unlink php56
# brew install php@7.4

# brew services start php
# brew services restart php

# Now we want to clean out the old configuration options for PHP:
# $ rm -Rf /usr/local/etc/php/*

# https://getgrav.org/blog/macos-catalina-apache-multiple-php-versions
# curl -L https://gist.githubusercontent.com/rhukster/f4c04f1bf59e0b74e335ee5d186a98e2/raw > /usr/local/bin/sphp
# chmod +x /usr/local/bin/sphp

# pecl install memcached

# ln -s /usr/local/opt/php /usr/local/opt/php@7.4
# ln -s /usr/local/opt/php /usr/local/opt/php@7.2

# sudo blackfire-agent --register --server-id=fbfea6d3-961e-492d-bbb1-8fd0d39d34de --server-token=ad2555dba8d54d06d620a874ab90fcf56431a55a19ea585ab4cf2c26fa2e8d76

# export BLACKFIRE_CLIENT_ID=xxx
# export BLACKFIRE_CLIENT_TOKEN=yyy
# export BLACKFIRE_LOG_LEVEL=4
# export BLACKFIRE_LOG_FILE=/tmp/probe.log

# COMPOSER_MEMORY_LIMIT=-1

# ls -al /usr/local/bin/php
