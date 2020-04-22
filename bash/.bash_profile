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
