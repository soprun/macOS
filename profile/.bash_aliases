#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034

# https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

# see: https://github.com/mathiasbynens/dotfiles/blob/main/.aliases

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias to-home='cd ${HOME}'
alias to-ssh='cd ${HOME}/.ssh'
alias to-dev='cd ${HOME}/dev'

# List all files colorized in long format
alias l="ls -lFG"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAFG"

# List only directories
alias lsd="ls -lFG | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls -G"

# Edition hosts file
alias edit-hosts="sudo vim /etc/hosts"
alias edit-hosts-code="code /etc/hosts"
alias hosts="edit-hosts"
alias hosts-code="edit-hosts-code"

# IP addresses
#alias ip=""
alias ip-local="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

#4: Generate sha1 digest
alias sha1='openssl sha1'

#3: Control grep command output
# https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/
# grep command is a command-line utility for searching plain-text files for lines matching a regular expression:

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#11: Control output of networking tool called ping
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

# Do not wait interval 1 second, go fast #
# Example: ping_fast google.com
alias ping_fast='ping -c 100 -s 20'

# 12: Show open ports
# https://www.cyberciti.biz/faq/how-do-i-find-out-what-ports-are-listeningopen-on-my-linuxfreebsd-server/
# Use netstat command to quickly list all TCP/UDP port on the server:

alias ports='netstat -tulanp'

#15: Debug web server / cdn problems with curl
# get web server headers #
alias header='curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

#19: Tune sudo and su
# become root #
alias root='sudo -i'
alias su='sudo -i'

#25: Get system memory, cpu usage, and gpu memory info quickly
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps aux | sort -nr -k 3'
alias pscpu10='ps aux | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Docker alias and function
# https://github.com/tcnksm/docker-alias/blob/master/zshrc

alias php-ini='code --add "$(php -r "echo php_ini_loaded_file();")"'
alias php-restart='brew services restart php'

# alias composer-install='composer --ignore-platform-reqs --no-scripts install'

alias nproc='sysctl -n hw.ncpu'

alias composer-suggests-ext='composer suggests --all --list | grep "ext-*"'

# alias git-pull='git pull --rebase --verify-signature'
