# see: https://github.com/mathiasbynens/dotfiles/blob/main/.aliases

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias to-home="cd ${HOME}"
alias to-ssh="cd ${HOME}/.ssh"
alias to-dev="cd ${HOME}/dev"

# List all files colorized in long format
alias l="ls -lFG"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAFG"

# List only directories
alias lsd="ls -lFG | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls -G"

# Edition hosts file
alias hosts="sudo code /etc/hosts"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
#alias ip-local="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
