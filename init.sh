#!/usr/bin/env bash

ln -sf "$PWD/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$PWD/bash/.profile" "$HOME/.profile"
ln -sf "$PWD/bash/.bash_aliases" "$HOME/.bash_aliases"

ln -sf "$PWD/git.conf" "$HOME/.gitconfig"
ln -sf "$PWD/ssh.conf" "$HOME/.ssh/config"
ln -sf "$PWD/gpg.conf" "$HOME/.gnupg/gpg.conf"

# exec "${PWD}/ssh-key-generation.sh"
echo "You've successfully copy bash profiler."
