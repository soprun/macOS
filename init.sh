#!/usr/bin/env bash

rm -f ~/.bash_profile
rm -f ~/.zshrc
rm -f ~/.gitconfig
rm -f ~/.ssh/config

ln -s "$PWD/.bash_profile" ~/.bash_profile
ln -s "$PWD/.bash_profile" ~/.zshrc
ln -s "$PWD/git.conf" ~/.gitconfig
ln -s "$PWD/ssh.conf" ~/.ssh/config
