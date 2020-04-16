#!/usr/bin/env bash

# gpg --list-keys --quiet
# keyid-format 0xlong

#SecurityKey

# PASSPHRASE

# echo ${GPG_KEY_ID}
export GPG_KEY_ID="C5DC44C2"
export GPG_KEY_FINGERPRINT="B7502F96C5DC44C2"
export GPG_KEY_FORMAT="B7502F96C5DC44C2"

# git config --local gpg.x509.program smimesign
# git config --local gpg.format x509

# git config --global gpg.program smimesign
git config --global gpg.program gpg
git config --global commit.gpgsign true
git config --global user.signingkey ${GPG_KEY_FINGERPRINT}

# gpg --recv-keys

# gpg2 --armor --import ~/SecurityKey/C5DC44C2.asc

# echo $GPG_KEY_FINGERPRINT;

# gpg --receive-keys $GPG_KEY_FINGERPRINT

# curl https://keybase.io/soprun/pgp_keys.asc | gpg --import


# alias gedit="gpg --edit-key ${GPG_KEY_ID}"
# git config --global gpg.format x509


# --------------------------------------------------

# Creates a signed commit
git commit -S -m your commit message
