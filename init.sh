#!/usr/bin/env bash

set -euo pipefail

# Determine the build script's actual directory, following symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  SOURCE="$(readlink "$SOURCE")"
done

SOURCE_DIR="$(cd -P "$(dirname "${SOURCE}")" && pwd)"

# shellcheck source=./scripts/colors.sh
source "${SOURCE_DIR}/scripts/colors.sh"

# shellcheck source=./scripts/logger.sh
source "${SOURCE_DIR}/scripts/logger.sh"

# shellcheck source=./scripts/utils.sh
source "${SOURCE_DIR}/scripts/utils.sh"

log_info 'Check system required dependencies'

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

command_exists docker || {
  log_error "Command 'docker' is not installed."
}

command_exists docker-compose || {
  log_error "Command 'docker-compose' is not installed."
}

command_exists git || {
  log_error "Command 'git' is not installed."
}

command_exists make || {
  log_error "Command 'make' is not installed."
}

command_exists gpg || {
  log_error "Command 'gpg' is not installed."
}

command_exists openssl || {
  log_error "Command 'openssl' is not installed."
}

command_exists mkcert || {
  log_warn "Command 'mkcert' is not installed."
}

command_exists shellcheck || {
  log_warn "Command 'shellcheck' is not installed."
}
