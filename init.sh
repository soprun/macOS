#!/usr/bin/env bash

ln -sf "$PWD/.bash_profile" "$HOME/.bash_profile"
ln -sf "$PWD/.bash_aliases" "$HOME/.bash_aliases"
ln -sf "$PWD/.bashrc" "$HOME/.bashrc"
ln -sf "$PWD/.profile" "$HOME/.profile"

ln -sf "$PWD/git.conf" "$HOME/.gitconfig"
ln -sf "$PWD/ssh.conf" "$HOME/.ssh/config"

# exec "${PWD}/ssh-key-generation.sh"

echo "You've successfully copy bash profiler."
