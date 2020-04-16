#!/usr/bin/env bash

#set -ue
set -eu -o pipefail

# identity="develop@soprun.com"
# hostname="github.com"
# remote_host="github.com"

identity=${1:-"develop@soprun.com"}

echo "Enter identity [${identity}]: "

if read -t 0 identity_user; then
  identity=${identity_user};
fi

#rm -rf ~/.ssh/*

mkdir -p "${HOME}/.ssh"
chmod 0700 "${HOME}/.ssh"

# echo "Authentication key generation!"

filename="${HOME}/.ssh/${identity}_rsa"
key_public="${filename}.pub"
key_private="${filename}"

if [[ ! -f ${filename} ]]; then
  declare -ir bits=2048
  declare -r type="rsa"
  declare passphrase="secret-${identity}";
  # echo "Wait!.."
  # sleep 2;

  echo "Enter passphrase [${passphrase}]: "
  if read -t 0 -s passphrase_user; then
    passphrase=${passphrase_user};
  fi

  clear;
  echo -e "Generating an ${type}-${bits} bit key for \"${identity}\"";

  ssh-keygen \
    -q \
    -b ${bits} \
    -t ${type} \
    -N ${passphrase} \
    -C ${identity} \
    -f ${filename}

  chmod 400 ${filename};

  echo -e "\t- public key: ${key_public}"
  echo -e "\t- private key: ${key_private}"
fi

echo "";
exec pbcopy < ${key_public} | pbpaste
echo "";

if [[ ! -z ${SSH_AGENT_PID:-} ]]; then
  eval $(ssh-agent -s) > /dev/null
fi;

# ssh-add -L ${key_private}

# ssh -i ${key_public} -T git@gitlab.com

echo "Finished.."
# Hi soprun! You've successfully authenticated, but GitHub does not provide shell access.
exit 0;
