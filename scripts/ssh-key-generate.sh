#!/bin/bash

# ssh-keygen -t rsa -b 4096 -N '' -f ${ID_SSH_KEY} -C ${ID_EMAIL}

echo "Key used: ${ID_GPG_KEY}!"

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

gpg --export-ssh-key ${ID_GPG_KEY}

gpg --expert --edit-key $ID_GPG_KEY


# Attempts to ssh to GitHub
ssh -T git@github.com
