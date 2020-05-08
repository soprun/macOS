# .bash_profile runs at login, including over SSH

# Enable tracing
# set -x

# if running bash
if [[ -n "$BASH_VERSION" ]]; then
  # include .bashrc if it exists
  if [[ -rf "$HOME/.bashrc" ]]; then
  . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
  PATH="$HOME/bin:$PATH"
fi

# Use bash-completion, if available
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && \
  . "/usr/local/etc/profile.d/bash_completion.sh"

# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export PATH="/usr/local/opt/sqlite/bin:$PATH"
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/go@1.13/bin:$PATH"

function get-url() {
  ( curl -LS --ssl-reqd --url $* )
}

function get-url-head() {
  ( get-url $* --head )
}

function gpg-url-import() {
  ( curl -sSL --ssl-reqd --url $* | gpg --import -)
}

# -I, --head - Show document info only
# -L, --location - Follow redirects (H)
# -S, --show-error - Show error.
# curl -ILS --ssl-reqd --url 'https://soprun.com'
# curl -ILS 'https://keys.openpgp.org/vks/v1/by-fingerprint/8120213055C84C2C3324FB08B7502F96C5DC44C2'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/soprun/google-cloud-sdk/path.bash.inc' ]; then . '/Users/soprun/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/soprun/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/soprun/google-cloud-sdk/completion.bash.inc'; fi
