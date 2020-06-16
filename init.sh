#!/usr/bin/env bash

# todo: I think it's about signing through certificates.!!
# git config --local gpg.x509.program smimesign

git config --global gpg.format x509
git config --global gpg.program gpg
git config --global commit.gpgsign true
git config --global user.signingkey ${ID_GPG_KEY}

pkill ssh-agent;
pkill gpg-agent;
