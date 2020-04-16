#!/usr/bin/env bash

set -e

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

identity="develop"
remote_host="github.com"

key="${HOME}/.ssh/${identity}_rsa"
key_public="${key}.pub"

# identity

# rm -rf ~/.ssh;
# mkdir -p ~/.ssh
# mkdir -p "${HOME}/.ssh"
# chmod 0700 "${HOME}/.ssh"
# touch "${HOME}/.ssh/known_hosts"

if [[ ! -f ${key} ]]; then
    echo "${key} does not exist!"

    ssh-keygen \
      -t rsa \
      -b 2048 \
      -C ${identity} \
      -f ${key} \
      -P "1234567890"

    # ssh-add -L ${key}
    chmod 400 ${key}
fi


# ssh-keygen -p -f ${key_public};
# pbcopy < ${key}.pub;

# cat ${key}.pub;

# ssh-keygen -R example.com

# ssh-keygen -l -f ${key_public};
# ssh-add -L ${key}

# ssh-keygen -R gitlab.com

# ssh-add -K ${key}

# echo ${key};

# ssh -i ${key} -T git@gitlab.com

# ssh-keygen -F gitlab.com;

# ssh-add -K ${key}
# ssh ${identity}@${remote_host}:22


# ssh git@gitlab.com;
#

ssh -vT git@github.com

# ssh-keygen -R [example.com]:222

# ssh -T ${username}@github.com
