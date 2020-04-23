# .bashrc runs for each new Terminal session

# environment variables
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u:\w]\\$ \[$(tput sgr0)\]"
export EDITOR="open -enW" # open -enW | atom --wait

# alias definitions
if [[ -r ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# default variables and identity
export ID_USER="develop"
export ID_NAME="Vladislav Soprun"
export ID_EMAIL="develop@soprun.com"
export ID_GPG_KEY="B7502F96C5DC44C2"
export ID_SSH_KEY="${HOME}/.ssh/${ID_EMAIL}"

# GNU Privacy Guard
# SSH authentication

#function commit-changelog() {
#  local changelog_file="CHANGELOG.md"
#  local version="$1"
#  local modifiedFiles="$(git ls-files -m)"
#
#  if [[ ! -r ${changelog_file} ]]; then
#    touch ${changelog_file}
#  fi
#
#  git add CHANGELOG.md ${modifiedFiles}
#  git commit -am "Updating CHANGELOG.md for ${version} release"
#
#  # commit-changelog.
#  # alias
#  # git ls-files -m
#
#  git add CHANGELOG.md
#
#
#  echo ${version};
#  echo ${modifiedFiles};
#}
