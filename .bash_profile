return;

# shellcheck disable=SC2148
# #!/bin/bash
# .bash_profile runs at login, including over SSH

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
set -o errexit # Exit when simple command fails               'set -e'
#set -o errtrace # Exit on error inside any functions or subshells.
#set -o nounset  # Trigger error when expanding unset variables 'set -u'
#set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
set -o xtrace # Display expanded command and arguments       'set -x'

# if running bash
if [[ -n $BASH_VERSION ]]; then
  # include .bashrc if it exists
  if [ -e "${HOME}/.bashrc" ]; then
    # shellcheck source=./.bashrc
    . ~/.bashrc
  fi
fi

# export PS1="___________________    | \w @ \h (\u) \n| => "
# export PS2="| => "

# readonly text_normal='\033[0m';
# readonly text_success='\033[0;32m';
# readonly text_error='\033[0;31m';
# echo -e "=> ${text_success}.bash_profile 💾${text_normal}"

#######################################
# Bash Completion

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  # shellcheck source=/usr/local/etc/bash_completion
#  . $(brew --prefix)/etc/bash_completion
#fi

#######################################
# Google Cloud SDK.

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/soprun/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/soprun/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/soprun/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/soprun/google-cloud-sdk/completion.zsh.inc'; fi
