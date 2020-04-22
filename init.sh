#!/usr/bin/env bash

# .bash_profile config
ln -sf "${PWD}/bash/.bash_profile" ~/.bash_profile
ln -sf "${PWD}/bash/.bash_aliases" ~/.bash_aliases
ln -sf "${PWD}/bash/.bashrc" ~/.bashrc

chmod 700 ~/.bash_profile
chmod 700 ~/.bash_aliases
chmod 700 ~/.bashrc

# Git config
ln -sf "$PWD/git/git.conf" ~/.gitconfig

# SSH authentication
ln -sf "$PWD/ssh/ssh.conf" ~/.ssh/config

# GNU Privacy Guard
ln -sf "$PWD/gpg/gpg.conf" ~/.gnupg/gpg.conf
ln -sf "$PWD/gpg/dirmngr.conf" ~/.gnupg/dirmngr.conf
ln -sf "$PWD/gpg/gpg-agent.conf" ~/.gnupg/gpg-agent.conf

# exec "${PWD}/ssh-key-generation.sh"
echo "You've successfully copy bash profiler."
