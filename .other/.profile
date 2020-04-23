# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# Enable tracing
# bash -x

# if running bash
if [[ -n "$BASH_VERSION" ]]; then
  # include .bashrc if it exists
  if [[ -f "$HOME/.bashrc" ]]; then
  . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
  PATH="$HOME/bin:$PATH"
fi

# echo 'export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.bash_profile

#Bash completion has been installed to:
#  /usr/local/etc/bash_completion.d
#
#zsh completions and functions have been installed to:
#  /usr/local/share/zsh/site-functions
#
#Emacs Lisp files have been installed to:
#  /usr/local/share/emacs/site-lisp/git


commit...
