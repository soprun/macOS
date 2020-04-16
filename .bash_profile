
# var
aliases_file="${HOME}/.bash_aliases"

# Source global definitions
if [[ -f ${aliases_file} ]]; then
  source ${aliases_file};
fi

# ssh_key_default="default_rsa.pub"
# ssh_key_yubikey="yubikey_rsa.pub"
# ssh_key_gpg=""

# ssh_key_default="default_rsa"

#develop_email="develop@soprun.com"
#develop_name="Vladislav Soprun"
#develop_key="$HOME/.ssh/id_rsa_develop"
#
#if [[ ! -f ${develop_key} ]]; then
#    echo "${develop_key} does not exist!"
#    # ssh-keygen -b 2048 -C ${gcloud_user} -f ${gcloud_ssh_key} -N '' -t rsa
#fi


# SSH authentication
# killall gpg-agent > /dev/null 2>&1
# killall ssh-agent > /dev/null 2>&1

# pkill ssh-agent;
# pkill gpg-agent;

# eval "$(ssh-agent -s)" > /dev/null
