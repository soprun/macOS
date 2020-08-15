# shellcheck disable=SC2148
# #!/bin/bash
# .bash_profile runs at login, including over SSH

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# See: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
# set -o errexit # Exit when simple command fails               'set -e'
#set -o errtrace # Exit on error inside any functions or subshells.
#set -o nounset  # Trigger error when expanding unset variables 'set -u'
#set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
# set -o xtrace # Display expanded command and arguments       'set -x'

# include .bashrc if it exists
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# # 1. Check if .env file exists
# if [ -e ~.env ]; then
#   # shellcheck source=./.env
#   source .env
# fi
#
# # 2. Check if .env.local file exists
# if [ -e .env.local ]; then
#   # shellcheck source=./.env.local
#   source .env.local
# fi


# todo: https://www.funtoo.org/Keychain


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/soprun/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(history)
plugins=(sudo)
plugins=(brew)
plugins=(common-aliases)
plugins=(composer)
# plugins+=(dotenv)
plugins+=(git git-flow gitignore github git-auto-fetch)
plugins+=(gpg-agent ssh-agent)
plugins+=(docker docker-compose)
plugins+=(gcloud)
plugins+=(symfony)
plugins+=(homestead)
plugins+=(keychain vault)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Add commonly used folders to $PATH
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#
## Specify default editor. Possible values: vim, nano, ed etc.
#export EDITOR=vim
#
## File search functions
#function f() { find . -iname "*$1*" ${@:2} }
#function r() { grep "$1" ${@:2} -R . }
#
## Create a folder and move into it in one command
##function mkcd() { mkdir -p "$@" && cd "$_"; }
#
## Example aliases
#alias cppcompile='c++ -std=c++11 -stdlib=libc++'
#alias g='git'



###############################################################################
# Homestead
###############################################################################

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# Homestead

alias homestead-edit='code ~/Homestead/Homestead.yaml'
alias homestead-update='cd ~/Homestead && vagrant box update && git pull origin master'

# starts and provisions the vagrant environment
alias hup='homestead up'
alias hupp='homestead up --provision --color --parallel'

# restarts vagrant machine, loads new Vagrantfile configuration
alias hr='homestead reload --provision'

# stops the vagrant machine
alias hdown='homestead halt'

alias hssh='homestead ssh'

alias hrf='homestead reload && homestead up --provision --color --parallel'



alias hosts="cat /etc/hosts"
alias hosts-edit='code /etc/hosts'

alias edit-ssh='sudo code /etc/hosts'

### short
alias edit-homestead='homestead-edit'
alias edit-hosts='hosts-edit'

# get-url https://soprun.com
function get-url() {
  ( curl -LS --ssl-reqd --url $* )
}

# get-url-head https://soprun.com
function get-url-head() {
  ( get-url $* --head )
}

# get-url-head http://billing.local
