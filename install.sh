#!/bin/bash

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
set -o errexit  # Exit when simple command fails               'set -e'
set -o errtrace # Exit on error inside any functions or subshells.
#set -o nounset  # Trigger error when expanding unset variables 'set -u'
set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
# set -o xtrace   # Display expanded command and arguments       'set -x'

# bash --login -x
# Параметр --login указан потому, что .bash_profile читается оболочками входа.
# Дополнительную информацию об отладке сценариев bash можно найти здесь:
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html

# Determine the build script's actual directory, following symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  SOURCE="$(readlink "$SOURCE")"
done

SCRIPT_DIR="$(cd -P "$(dirname "${SOURCE}")" && pwd)"

# 1. Check if .env file exists
if [ -e "${SCRIPT_DIR}/.env" ]; then
  # shellcheck source=./.env
  source "${SCRIPT_DIR}/.env"
fi

# shellcheck source=./scripts/colors.sh
source "${SCRIPT_DIR}/scripts/colors.sh"
# shellcheck source=./scripts/logger.sh
source "${SCRIPT_DIR}/scripts/logger.sh"
# shellcheck source=./scripts/date_format.sh
source "${SCRIPT_DIR}/scripts/date_format.sh"
# shellcheck source=./scripts/file_backup.sh
source "${SCRIPT_DIR}/scripts/file_backup.sh"

log_success 'Load environment variables - is succeeded!'

load_source() {
  local source_file="$1"

  if [ ! -f $source_file ]; then
    log_error "File $source_file does not exists."
  fi

  # shellcheck source=./
  . $source_file

  log_info "load => $source_file - is succeeded!"
}

#load_source "./install/check_environment.sh"
#load_source "./install/check_directory.sh"
#load_source "./install/check_system_dependencies.sh"
#

echo 'is succeeded!'
