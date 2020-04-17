#!/usr/bin/env bash

# gpg --list-keys --quiet
# keyid-format 0xlong

#SecurityKey

# PASSPHRASE

#gpg -k

# gpg --fingerprint "develop@soprun.com"
# gpg --edit-key ${GPG_KEY_ID}


# git config --local gpg.x509.program smimesign
# git config --local gpg.format x509

# git config --global gpg.program smimesign
# git config --global gpg.program gpg2
# git config --global commit.gpgsign false
# git config --global user.signingkey ${GPG_KEY_FINGERPRINT}

# gpg --recv-keys

# gpg2 --armor --import ~/SecurityKey/C5DC44C2.asc

# echo $GPG_KEY_FINGERPRINT;

# gpg --receive-keys $GPG_KEY_FINGERPRINT

# curl https://keybase.io/soprun/pgp_keys.asc | gpg --import


# alias gedit="gpg --edit-key ${GPG_KEY_ID}"
# git config --global gpg.format x509


# --------------------------------------------------

# Creates a signed commit
# git commit -m "initial commit message..."
# git commit -S -m "signed commit message..."
