#######################################################################
# User configuration
#######################################################################

# Add `~/bin` to the `$PATH` so it includes user's private bin
export PATH="$HOME/bin:$PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

#######################################################################
# Load environment variables
#######################################################################

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ${HOME}/.{env,env.local,aliases}; do
  # shellcheck source=./.env
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

#export ID_NAME
#export ID_USER
#export ID_EMAIL
#export ID_GPG_KEY
