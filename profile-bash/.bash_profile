#######################################################################
# User configuration
#######################################################################

# Add `~/bin` to the `$PATH` so it includes user's private bin
export PATH="$HOME/bin:$PATH"

###
### System default environment variables.
###

# You may need to manually set your language environment
#export LC_ALL=ru_RU.UTF-8
#export LANG=ru_RU.UTF-8

# Preferred editor for local and remote sessions
#export EDITOR='code'
#export CLICOLOR="1"

#######################################################################
# Load environment variables
#######################################################################

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ${HOME}/.{env,env.local,.bash_aliases}; do
  # shellcheck source=./../.env
  # shellcheck source=./.bash_aliases
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

#######################################################################
# Export environment variables
#######################################################################

###
### Identity environment variables
###

export ID_NAME
export ID_USER
export ID_EMAIL
export ID_GPG_KEY

export COMPOSER_HOME
export COMPOSER_CACHE_DIR
export COMPOSER_MEMORY_LIMIT
export COMPOSER_ALLOW_SUPERUSER
