#!/usr/bin/env bash
# set -e

# rm -rf "${HOME}/.ssh/k"
# if not existing, first create folder
mkdir -p "$HOME/.ssh"
chmod 0700 "$HOME/.ssh"

echo "Generating a new SSH key"
echo $SSH_KEY
exit;

echo "Environment variables are not set."

[[ -z ${SSH_KEY} ]] && echo "Empty"; exit 1;

if [[ ! -f ${SSH_KEY} ]]; then
  echo "Generating key for \"${SSH_KEY_EMAIL}\"";

  # Generate Keypair - Enter and password
  ssh-keygen \
    -q \
    -b 4096 \
    -t "rsa" \
    -N "" \
    -C ${SSH_KEY_EMAIL} \
    -f ${SSH_KEY}

  chmod 600 ${SSH_KEY}
  chmod 400 ${SSH_KEY_PUBLIC}
fi


echo "Starting the ssh-agent in the background"
pkill ssh-agent
eval "$(ssh-agent -s)" > /dev/null

echo "Adding your SSH key to the ssh-agent"
# ssh-add "${SSH_KEY}"
# ssh-add -l
ssh-add -K ${SSH_KEY}
ssh-keygen -l -f "${SSH_KEY_PUBLIC}"

# TODO: add ssh-keysign

echo "Copy the public SSH key content to your clipboard"
pbcopy < "${SSH_KEY_PUBLIC}"

echo "-----------"
cat "${SSH_KEY_PUBLIC}"
echo "-----------"

echo "Hi, ${SSH_KEY_EMAIL} 👀"
echo "You've successfully generate key."
echo "Public key: ${SSH_KEY_PUBLIC}"

echo ""
echo "Test your connection:"
echo "GitHub: ssh -T git@github.com"
ssh -T git@github.com
