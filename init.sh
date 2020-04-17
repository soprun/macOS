#!/usr/bin/env bash

ln -sf "$PWD/.bash_profile" "$HOME/.bash_profile"
ln -sf "$PWD/git.conf" "$HOME/.gitconfig"
ln -sf "$PWD/ssh.conf" "$HOME/.ssh/config"
ln -sf "$PWD/gpg.conf" "$HOME/.gnupg/gpg.conf"

# exec "${PWD}/ssh-key-generation.sh"
echo "You've successfully copy bash profiler."
