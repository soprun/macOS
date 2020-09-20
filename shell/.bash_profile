# Add `~/bin` to the `$PATH` so it includes user's private bin
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{env,env.local,aliases}; do
  # shellcheck source=./.aliases
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

tput sgr0

# Be very strict
set -eo pipefail
[ "$BASH_PROFILE_DEBUG" = true ] && set -x

###
### Default environment variables
###

export LANG
export CLICOLOR
export EDITOR

###
### Identity environment variables
###

export ID_NAME
export ID_USER
export ID_EMAIL
export ID_GPG_KEY

###
### Git environment variables
###

#GIT_NAME="${ID_NAME}"
#GIT_EMAIL="develop@soprun.com"
#GIT_GPG_KEY="${ID_GPG_KEY}"
export GIT_GPG_SIGN
export GIT_GPG_PROGRAM
export GIT_EDITOR

###
### GitHub environment variables
###

export GITHUB_USER
export GITHUB_TOKEN

###
### Composer environment variables
###

export COMPOSER_HOME
export COMPOSER_CACHE_DIR
export COMPOSER_MEMORY_LIMIT
export COMPOSER_ALLOW_SUPERUSER
#export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

###
### Docker environment variables
###

export DOCKER_DEBUG
export DOCKER_BUILDKIT
export DOCKER_STACK_ORCHESTRATOR
export COMPOSE_DOCKER_CLI_BUILD
#export BUILDKIT_PROGRESS

#eval $(docker-machine env default)

###
### GNU Privacy Guard
### https://github.com/drduh/YubiKey-Guide#ssh
###

# GPG_KEY_ID="B7502F96C5DC44C2"
# GPG_KEY_EMAIL="mail@soprun.com"
# GPG_KEY_FINGERPRINT=""
# GPG_KEY_FORMAT="short" # short, 0xshort or long, 0xlong
# GPG_KEY_SERVER="keys.openpgp.org"
