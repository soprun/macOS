#!/usr/bin/env bash

bash_profile="$HOME/.bash_profile";
bash_profile_src="$PWD/.bash_profile";

# ln -sf ${bash_profile_src} ${bash_profile}

cat ${bash_profile}
exit;

# touch .bash_profile
# echo "${key} does not exist!"

bash_aliases="$HOME/.bash_aliases";
bash_aliases_src="$PWD/.bash_aliases";

ln -sf ${bash_aliases_src} ${bash_aliases}

ln -sf "$PWD/git.conf" "$HOME/.gitconfig"
ln -sf "$PWD/ssh/config.conf" "$HOME/.ssh/config"
ln -sf "$PWD/ssh/options.conf" "$HOME/.ssh/options"
