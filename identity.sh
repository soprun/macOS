#!/usr/bin/env bash

function identity-gen() {
  local id="$1"
  local filename="$2"

  echo "Generating key for \"${filename}\""
  return

  #    -q \
  ssh-keygen \
    -b 4096 \
    -t "rsa" \
    -N "" \
    -C ${id} \
    -f ${filename}

  echo ${filename}
}

rm -rf ${ID_SSH_KEY}

if [[ ! -f ${ID_SSH_KEY} ]]; then
  # identity-gen ${ID_EMAIL} ${ID_SSH_KEY}

  # echo "Generating key for \"${filename}\""

  gpg2 --fingerprint ${ID_GPG_KEY}
fi
