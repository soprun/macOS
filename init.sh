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
  # set -o allexport
  # shellcheck source=./.env
  source "${SCRIPT_DIR}/.env"
  # set +o allexport
fi

# shellcheck source=./scripts/colors.sh
source "${SCRIPT_DIR}/scripts/colors.sh"
# shellcheck source=./scripts/logger.sh
source "${SCRIPT_DIR}/scripts/logger.sh"

main() {
  log_info 'The main command is executed.'

  declare -a files=(
    .bash_aliases
    .bashrc
    .profile
    .zprofile
    .zshrc
    .env
  )

  for file in "${files[@]}"; do
    local source_file="${SCRIPT_DIR}/${file}"
    local target_file="${HOME}/${file}"

    if [ ! -f $source_file ]; then
      log_error "File $source_file is exists."
    fi

    if [ -f $target_file ]; then
      rm $target_file
      log_debug "Remove file: $target_file"
    fi

    ln -sf $source_file $target_file
    chmod 700 $target_file
    log_success "Executed install $file => $source_file"
  done

  rm -rf "${HOME}/bin"
  ln -sf "${SCRIPT_DIR}/bin" "${HOME}/bin"
  chmod 700 "${HOME}/bin"
}

main "$@"
