#!/bin/zsh

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/soprun/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# plugins: git-auto-fetch
# see: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-auto-fetch

GIT_AUTO_FETCH_INTERVAL=1200 # in seconds

# plugins: git-prompt
# url: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-prompt

ZSH_THEME_GIT_PROMPT_CACHE="true"

# plugins: zsh-command-time
# url: https://github.com/popstas/zsh-command-time

export ZSH_COMMAND_TIME="true"

# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"

# Message color.
# ZSH_COMMAND_TIME_COLOR="cyan"

# Exclude some commands
# ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit)

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# see: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  common-aliases
  osx
  extract

  safe-paste
  colorize
  command-not-found

  git
  git-flow
  git-auto-fetch

  docker
  docker-compose
  docker-machine
  kubectl
  brew
  composer
  history
  iterm2
  
  keychain
  ssh-agent
  gpg-agent

  npm
  node
  yarn
  
  zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
  command-time
  history-substring-search
)

# shellcheck source=./oh-my-zsh.sh
source "$ZSH/oh-my-zsh.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# Compilation flags
#export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# include .bash_profile if it exists
if [ -e "${HOME}/.bash_profile" ]; then
  # shellcheck source=./../profile-bash/.bash_profile
  source "${HOME}/.bash_profile"
fi

eval $(docker-machine env default) &>/dev/null

# source <(kubectl completion zsh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

source ~/.iterm2_shell_integration.zsh

autoload -U compinit && compinit

# an example prompt
# PROMPT='%B%m%~%b$(git_super_status) %# '
# PROMPT='\h:\W \u\$'

# поддержка ~… и file completion после = в аргументах
# setopt MAGIC_EQUAL_SUBST
# не обрабатывать escape sequence в echo без -e
# setopt BSD_ECHO
# поддержка комментариев в командной строке
# setopt INTERACTIVE_COMMENTS
# поддержка $(cmd) в $PS1 etc.
# setopt PROMPT_SUBST

# fpath=(~/my-zsh-functions $fpath)
# autoload -Uz fn
# fn

