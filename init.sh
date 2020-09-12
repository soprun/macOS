#!/bin/bash

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
set -o errexit  # Exit when simple command fails               'set -e'
set -o errtrace # Exit on error inside any functions or subshells.
set -o nounset  # Trigger error when expanding unset variables 'set -u'
set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
# set -o xtrace   # Display expanded command and arguments       'set -x'

# Determine the build script's actual directory, following symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  SOURCE="$(readlink "$SOURCE")"
done

SCRIPT_DIR="$(cd -P "$(dirname "${SOURCE}")" && pwd)"

# 1. Check if .env file exists
if [ -e "${SCRIPT_DIR}/.env" ]; then
  set -o allexport
  # shellcheck source=./.env
  source "${SCRIPT_DIR}/.env"
  set +o allexport
fi

# shellcheck source=./scripts/colors.sh
source "${SCRIPT_DIR}/scripts/colors.sh"
# shellcheck source=./scripts/logger.sh
source "${SCRIPT_DIR}/scripts/logger.sh"

#printenv | sort | less

main() {
  log_info 'The main command is executed.'
  FILES="${HOME}/.bash_aliases ${HOME}/.bash_profile ${HOME}/.bashrc ${HOME}/.bashrc ${HOME}/.profile ${HOME}/.zshenv ${HOME}/.zprofile ${HOME}/.zshrc ${HOME}/.bash"

  for FILE in $FILES; do
    rm -rf $FILE
    log_info "Remove $FILE"
  done

  if [ -z "${BASH_PROFILE_HOME:-}" ]; then
    log_error 'Environment variables BASH_PROFILE_HOME is not defined!'
  fi

  log_info $BASH_PROFILE_HOME

  if [ -z "${BASH_PROFILE_BIN:-}" ]; then
    log_error 'Environment variables BASH_PROFILE_BIN is not defined!'
  fi

  log_info $BASH_PROFILE_BIN

  rm -rf $BASH_PROFILE_HOME
  mkdir -p $BASH_PROFILE_HOME

  ln -sf "${PWD}/.env" "${BASH_PROFILE_HOME}/.env"
  ln -sf "${PWD}/bin" $BASH_PROFILE_BIN
  ls -lasG $BASH_PROFILE_HOME

  ln -sf "${PWD}/.profile" ~/.profile
  chmod 700 ~/.profile

  ln -sf "${PWD}/.bash_aliases" ~/.bash_aliases
  chmod 700 ~/.bash_aliases

  ln -sf "${PWD}/.bashrc" ~/.bashrc
  chmod 700 ~/.bashrc

  ln -sf "${PWD}/.zprofile" ~/.zprofile
  chmod 700 ~/.zprofile

  ln -sf "${PWD}/.zshrc" ~/.zshrc
  chmod 700 ~/.zshrc

  ln -sf "${PWD}/.zshenv" ~/.zshenv
  chmod 700 ~/.zshenv

  ls -lasG ${HOME}
}

main "$@"
