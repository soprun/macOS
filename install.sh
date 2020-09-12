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

## shellcheck source=./scripts/colors.sh
#source "${SCRIPT_DIR}/scripts/colors.sh"
## shellcheck source=./scripts/logger.sh
#source "${SCRIPT_DIR}/scripts/logger.sh"
## shellcheck source=./scripts/date_format.sh
#source "${SCRIPT_DIR}/scripts/date_format.sh"
## shellcheck source=./scripts/file_backup.sh
#source "${SCRIPT_DIR}/scripts/file_backup.sh"
#
#log_success 'Load environment variables - is succeeded!'
#
#load_source() {
#  local source_file="$1"
#
#  if [ ! -f $source_file ]; then
#    log_error "File $source_file does not exists."
#  fi
#
#  # shellcheck source=./
#  . $source_file
#
#  log_info "load => $source_file - is succeeded!"
#}
#
##load_source "./install/check_environment.sh"
##load_source "./install/check_directory.sh"
##load_source "./install/check_system_dependencies.sh"
##
#
#echo 'is succeeded!'

source ./scripts/logger.sh

log_error() {
  printf "=>$COLOR_RED error:$COLOR_RESET $*\n$COLOR_RESET" >&2
  logger -p user.error -t "$(basename "${0}")" "$@"
  exit 1
}

FILES="~/.bash_aliases ~/.bash_profile ~/.bashrc ~/.bashrc ~/.profile ~/.zshenv ~/.zprofile ~/.zshrc"

for FILE in $FILES; do
  rm -rf $FILE
  echo "Remove $FILE"
done
#
##ln -sf "${PWD}/.bash_aliases" ~/.bash_aliases
##ln -sf "${PWD}/.bash_profile" ~/.bash_profile
##ln -sf "${PWD}/.bashrc" ~/.bashrc
#
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

if [ -z "${BASH_PROFILE_HOME:-}" ]; then
  log_error 'Environment variables BASH_PROFILE_HOME is not defined!'
fi

if [ -z "${BASH_PROFILE_BIN:-}" ]; then
  log_error 'Environment variables BASH_PROFILE_BIN is not defined!'
fi

log_info $BASH_PROFILE_HOME
log_info $BASH_PROFILE_BIN

rm -rf $BASH_PROFILE_HOME
mkdir -p $BASH_PROFILE_HOME

ln -sf "${PWD}/.env" "${BASH_PROFILE_HOME}/.env"
chmod 700 "${BASH_PROFILE_HOME}/.env"

ln -sf "${PWD}/bin" $BASH_PROFILE_BIN
chmod 700 $BASH_PROFILE_BIN

ls -lasG $BASH_PROFILE_HOME
# ls -laG $HOME
# printenv ID_SSSS
#
#zsh --version
#
## To set zsh as your default shell, execute the following assuming a default install of Homebrew
##chsh -s /usr/local/bin/zsh
## chsh -s $(which zsh)
#
##sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
#
#
#
#git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
#
#ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
#ln -s "$ZSH_CUSTOM/themes/typewritten/async.zsh" "$ZSH_CUSTOM/themes/async"
