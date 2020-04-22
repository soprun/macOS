#!/usr/bin/env bash

# printenv | grep TEST_VAR
# exit;

# touch ~/.bash_profile;
# open ~/.bash_profile

ln -sf "${PWD}/.bash_profile" ~/.bash_profile
ln -sf "${PWD}/.bash_aliases" ~/.bash_aliases
ln -sf "${PWD}/.bashrc" ~/.bashrc

#chmod 700 ~/.bash_profile
#chmod 700 ~/.bash_aliases
#chmod 700 ~/.bashrc
