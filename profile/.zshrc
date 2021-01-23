#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/soprun/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

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
plugins=(
	common-aliases
	osx
	extract
	colorize

	safe-paste
	colorize
	command-not-found

	git
	git-flow
	git-flow-completion
	git-auto-fetch
	git-prompt

	composer

	history
	history-sync

	docker
	docker-compose
	# docker-completion
	symfony

	brew

	ssh-agent
	gpg-agent

	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
	command-time
	history-substring-search

	iterm2

	# dotenv
	# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh_reload#zsh_reload-plugin
	zsh_reload

	zsh-interactive-cd
)

# shellcheck source=/dev/null
source "${ZSH}/oh-my-zsh.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=3
# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

# autoload -U compinstall && compinstall

autoload -Uz compinit && compinit
# autoload -U compinit && compinit

# shellcheck source=/dev/null
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# include .bash_profile if it exists
if [ -e "${HOME}/.bash_profile" ]; then
	# shellcheck disable=SC1091
	# shellcheck source=./.bash_profile
	source "${HOME}/.bash_profile"
fi

# https://github.com/junegunn/fzf#search-syntax
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# source "${ZSH}/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" &>/dev/null

# shellcheck source=/dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# AGNOSTER_PROMPT_SEGMENTS=("prompt_git" "${AGNOSTER_PROMPT_SEGMENTS[@]}")
# AGNOSTER_PROMPT_SEGMENTS+="prompt_end"

# PROMPT_SEGMENT_POSITION=5 PROMPT_SEGMENT_NAME="prompt_end";\
# AGNOSTER_PROMPT_SEGMENTS=("${AGNOSTER_PROMPT_SEGMENTS[@]:0:$PROMPT_SEGMENT_POSITION-1}" "$PROMPT_SEGMENT_NAME" "${AGNOSTER_PROMPT_SEGMENTS[@]:$PROMPT_SEGMENT_POSITION-1}");\
# unset PROMPT_SEGMENT_POSITION PROMPT_SEGMENT_NAME

# SWAP_SEGMENTS=(4 5);\
# TMP_VAR="$AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[1]]"; AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[1]]="$AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[2]]"; AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[2]]="$TMP_VAR"
# unset SWAP_SEGMENTS TMP_VAR

# AGNOSTER_PROMPT_SEGMENTS[5]=

# export AGNOSTER_PROMPT_SEGMENTS

# prompt_context() {
#     local seq
#     seq='%(!.{%F{yellow}%}.)%n'
#     if [[ "$USER" != "$DEFAULT_USER" ]]; then
#         seq="$seq@%m"
#     fi
#     prompt_segment black default $seq
# }

# prompt_segment() - Takes two arguments, background and foreground.
# Both can be omitted, rendering default background/foreground.

# customize_agnoster() {
#   prompt_segment 'red' '' ' ⚙ ⚡⚡⚡ ⚙  '
# }

# PROMPT="%{%f%b%k%}%n%~%?"
# PROMPT='%B%F{240}%1~%f%b %# '

# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# autoload -U promptinit
# promptinit

# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
# zstyle ':vcs_info:*' enable git

# PS1="%K%n%k@%m:%~/ > "
# PS2="> "
# RPS1="%(?..(%?%))"

# PS1="%{%f%b%k%}33$(build_prompt)12"
# PS2="%_>33"
