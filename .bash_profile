## Default variables: identity, security, gpg
#declare -r id_email="develop@soprun.com"
#declare -r id_name="Vladislav Soprun"
#
#declare -r gpg_key_id="C5DC44C2"
#declare -r gpg_key_email=${gpg_key_email:-${id_email}}
#
### Environment
#export SSH_KEY_EMAIL=${id_email}
#export SSH_KEY_ID="id_rsa"
#export SSH_KEY="${HOME}/.ssh/${SSH_KEY_ID}"
#export SSH_KEY_PUBLIC="${SSH_KEY}.pub"
## export ssh_key_passphrase=""
#
#export GPG_KEY_ID=${gpg_key_id}
#export GPG_KEY_EMAIL=${gpg_key_email}

# Source global definitions
profile_file="${HOME}/.profile"

if [[ -f ${profile_file} ]]; then
  source ${profile_file}
fi

# SSH authentication
if [[ ! -z ${SSH_AGENT_PID:-} ]]; then
  eval $(ssh-agent -s) > /dev/null 2>&1
fi;
