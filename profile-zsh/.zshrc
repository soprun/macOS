#!/bin/zsh

# include .bashrc if it exists
if [ -e "${HOME}/.bash_profile" ]; then
  # shellcheck source=./../profile-bash/.bash_profile
  source "${HOME}/.bash_profile"
fi
