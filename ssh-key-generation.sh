#!/usr/bin/env bash

set -e

# rm -rf "${HOME}/.ssh/k"
# if not existing, first create folder
mkdir -p "${HOME}/.ssh"
chmod 0700 "${HOME}/.ssh"

id="develop@soprun.com"
filename="${HOME}/.ssh/id_rsa"

if [[ ! -f ${filename} ]]; then
  echo "Generating key for \"${id}\"";

  # Generate Keypair - Enter and password
  ssh-keygen \
    -q \
    -b 4096 \
    -t "rsa" \
    -N "" \
    -C ${id} \
    -f ${filename}

  chmod 600 ${filename};
fi

echo "Starting the ssh-agent in the background"

pkill ssh-agent
eval "$(ssh-agent -s)" > /dev/null

echo "Adding your SSH key to the ssh-agent"
ssh-add "${filename}"
# ssh-add -L > /dev/null
# ssh-add -LAK > /dev/null

echo "Copy the public SSH key content to your clipboard"
pbcopy < "${filename}.pub"

echo "-----------"
cat "${filename}.pub"
echo "-----------"

echo "Hi, ${id} 👀"
echo "You've successfully generate key."
echo "Public key: ${filename}.pub"

echo ""
echo "Test your connection:"
echo "GitHub: ssh -T git@github.com"

ssh -T git@github.com
