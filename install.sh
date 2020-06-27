#!/usr/bin/env bash

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

# killall Finder;
# pkill ssh-agent;
# pkill gpg-agent;
