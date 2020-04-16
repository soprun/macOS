#!/bin/bash

set -u
# set -eu -o pipefail

#if read -t 2 -p "Enter your name: " name
#
#then
#  echo "Hello $name, welcome to my script"
#else
#  echo "Sorry, too slow! "
#fi
#
#exit;


if [[ $# -eq 0 ]]; then
    echo -e "An error occurred, empty parameters."
    exit 1;
fi



#[[ -n "${1:-}" ]]

#if [[ "${1:-unset}" == "unset" ]]; then
#    echo -e "No parameters found. "
#    exit 1
#fi

# [name] Имя пользователя для подключения к экземпляру.
# name="develop@soprun.com";
# hostname="soprun.com";

# [filename] это имя, которое вы хотите использовать для файлов ключей SSH.
# filename="id-${name}";
# Public key file: ~/.ssh/${filename}.pub
# key key file: ~/.ssh/${filename}

# filename="$HOME/.ssh/${filename}";

# [expire_time] is a value in ISO 8601 format. For example: 2018-12-04T20:12:00+0000.
# expire_time="";
# key_passphrase="";

#rm -f \
#  "${key_file}" \
#  "${key_file}.pub" \
#  "~/.ssh/known_hosts"

# identity="develop@soprun.com"
# hostname="github.com"
# remote_host="github.com"


identity=${1:-"develop@soprun.com"}

#if [[ -n "${0}" ]]; then
#  echo "No parameters found."
#fi

echo "Hello 👀: ${identity}"

exit;

#echo -e -n "Enter your identity [${identity}]: "
#read identity_input
#
#identity=${identity_input:-${identity}}
#
#echo -e "\n"


# identity

# pkill ssh-agent;
# killall ssh-agent;

rm -rf ~/.ssh/*;

# mkdir -p ~/.ssh
# mkdir -p "${HOME}/.ssh"
# chmod 0700 "${HOME}/.ssh"

# ssh $1 "googel.com"
# ssh $1 "uptime"

known_hosts="${HOME}/.ssh/known_hosts";

# SSH fingerprints
if [[ ! -f ${known_hosts} ]]; then
  echo -e "Create file: ${known_hosts}";
  touch ${known_hosts};
fi

# ssh-keyscan -H 192.168.1.162 >> ~/.ssh/known_hosts

# echo "Authentication key generation!"

declare -ir bits=2048
declare -r type="rsa"

passphrase=''

filename="${HOME}/.ssh/${identity}_rsa"
key_public="${filename}.pub"
key_private="${filename}"

if [[ ! -f ${filename} ]]; then
    echo -e "\nGenerating an ${type}-${bits} bit key for \"${identity}\"";

    # read -s -p "Enter your passphrase: " ${passphrase}
    # echo "Is your password really ${passphrase}? "

    ssh-keygen \
      -q \
      -b ${bits} \
      -t ${type} \
      -N ${passphrase} \
      -C ${identity} \
      -f ${filename}

    chmod 400 ${filename};
fi

# echo "Identity: ${identity}"
#
#die(){
#  echo "$1" 2>&1
#}

#if [[ -f ${key_public} ]]; then
##  echo -e "${key_public}"
#  # die "File not found";
#fi

echo -e "\tPublic key: ${key_public}"


# echo "Private key: ${key_private}"

# pbcopy < ${key_public};
# ssh-keyscan -H 192.168.1.162 >> ~/.ssh/known_hosts

#ssh-add -A;
#ssh-add -L;

#ssh-add -L -f ${filename}
# echo -e "-----"
# ssh -T git@github.com

echo "Finished.."
exit 0;
