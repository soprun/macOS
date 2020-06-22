# Enable tracing
# set -x
# https://natelandau.com/my-mac-osx-bash_profile/

# Set Paths
# ------------------------------------------------------------
export PATH="$PATH:/usr/local/bin/"
# export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# # if running bash
# if [[ -n "$BASH_VERSION" ]]; then
#   # include .bash_aliases if it exists
#   if [[ -rf "$HOME/.bash_aliases" ]]; then
#   . "$HOME/.bash_aliases"
#   fi
# fi

# ---------------------------------------
# SYSTEMS OPERATIONS & INFORMATION
# ---------------------------------------

# cleanupDS: recursively delete .DS_Store files
# -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# docker-compose up --build --detach
# docker-compose up --build --detach --force-recreate --remove-orphans

# docker-compose build --force-rm

# Stop one or more running containers
# docker stop $(docker ps -a -q)

# Remove one or more containers
# docker rm $(docker ps -a -q) --volumes