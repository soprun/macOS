#!/usr/bin/env bash

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

# https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/

# Enable tracing
set -e

echo "Creates a link to the profile file..."
ln -sf "${PWD}/.profile" ~/.profile
chmod 700 ~/.profile

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

killall Finder;
pkill ssh-agent;
pkill gpg-agent;

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



COMPOSER_MEMORY_LIMIT=-1 

ls -al /usr/local/bin/php