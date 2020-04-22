# ENVIRONMENT VARIABLES

# add my ~/bin dir to path
PATH=${PATH}:~/bin
export PATH

# simple prompt
# default macOS prompt is: \h:\W \u\$
export PS1="\W \$ "

# enable Terminal color
export CLICOLOR=1

# set EDITOR to bbedit
if [[ -e "/usr/local/bin/bbedit" ]]; then
    export EDITOR="bbedit -w --resume"
fi

# ALIASES

alias ll='ls -l'
alias lll='ls -alhTOe@'
alias ls='ls -l'

# save me from myself
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

# Ring the terminal bell, and badge Terminal's icon
alias badge="tput bel"

# insert an empty space in the Dock
alias dockspace="defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"spacer-tile\";}'; killall Dock;"

alias reveal='open -R'
alias xcode='open -a Xcode'
alias pacifist='open -a Pacifist'

# FUNCTIONS

# man commands
# http://scriptingosx.com/2017/04/on-viewing-man-pages/

function preman() {
	man -t $@ | open -f -a "Preview"
}

function xmanpage() {
	open x-man-page://$@
}

function bbman () {
  MANWIDTH=80 MANPAGER='col -bx' man $@ | bbedit --clean --view-top -t "man $@"
}

# prints the path of the front Finder window. Desktop if no window open
# http://scriptingosx.com/2017/02/terminal-finder-interaction/
function pwdf () {
	osascript <<EOS
		tell application "Finder"
			if (count of Finder windows) is 0 then
				set dir to (desktop as alias)
			else
				set dir to ((target of Finder window 1) as alias)
			end if
			return POSIX path of dir
		end tell
EOS
}

# changes directory to frontmost 
alias cdf='pwdf; cd "$(pwdf)"'
