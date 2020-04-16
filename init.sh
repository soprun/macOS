#!/usr/bin/env bash

ln -sf "$PWD/.bash_profile" "$HOME/.bash_profile"
ln -sf "$PWD/.bash_aliases" "$HOME/.bash_aliases"
ln -sf "$PWD/git.conf" "$HOME/.gitconfig"

ssh_config_target="$HOME/.ssh/config"
ssh_config_source="$PWD/ssh/config.conf"
# ssh_options_target="$HOME/.ssh/options"
# ssh_options_source="$PWD/ssh/options.conf"

ln -sf ${ssh_config_source} ${ssh_config_target}
# ln -sf ${ssh_options_source} ${ssh_options_target}
chmod 600 ${ssh_config_target}
# chmod 600 ${ssh_options_target}
