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
