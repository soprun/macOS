if [[ "$SHELL" = "/bin/bash" ]]; then
  . ~/.bashrc
fi

# Default variables: identity, security, gpg
id_email="develop@soprun.com"
id_name="Vladislav Soprun"

gpg_key_id="C5DC44C2"
gpg_key_email=${gpg_key_email:-${id_email}}

## Environment
export SSH_KEY_ID="id_rsa"
export SSH_KEY_EMAIL=${id_email}
export SSH_KEY="${HOME}/.ssh/${SSH_KEY_ID}"
export SSH_KEY_PUBLIC="${SSH_KEY}.pub"
# export ssh_key_passphrase=""

export GPG_KEY_ID=${gpg_key_id}
export GPG_KEY_EMAIL=${gpg_key_email}

