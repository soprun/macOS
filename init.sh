#!/usr/bin/env bash

backup_id="$(date +%Y-%m-%d_%H%M%S)";
backup_file="$PWD/.backup/archive-${backup_id}.zip";

# vars
bash_profile="$HOME/.bash_profile";
bash_profile_src="$PWD/.bash_profile";

# compress files
# zip -jD ${backup_file} ${bash_profile};

if [[ -f ${bash_profile} ]]; then
  zip -jD ${backup_file} ${bash_profile} > /dev/null 2>&1;

  # echo "Backup completed! Details about the output file: ${backup_file}"

  # remove file
  rm -f ${bash_profile} > /dev/null 2>&1;
fi

ln -s ${bash_profile_src} ${bash_profile};
# echo "Create links: ${bash_profile_src} > ${bash_profile}";



# rm -f "$HOME/.bash_profile"
# rm -f "$HOME/.gitconfig"
# rm -f "$HOME/.ssh/config"

# ln -s "$PWD/.bash_profile" "$HOME/.bash_profile"
# ln -s "$PWD/git.conf" ~/.gitconfig
# ln -s "$PWD/ssh.conf" ~/.ssh/config
# ln -s "$PWD/docker-drop.sh" /usr/local/bin/docker-drop
