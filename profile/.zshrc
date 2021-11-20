#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Homebrew
# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/soprun/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="af-magic"

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
DISABLE_UPDATE_PROMPT="true"

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
  macos
  extract
  colorize

  safe-paste
  command-not-found

  colored-man-pages
  pip
  python


  git
  git-flow
#   git-flow-completion
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

#   zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
#   command-time
#   history-substring-search

  iterm2

  # dotenv
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh_reload#zsh_reload-plugin
  # zsh_reload

  zsh-interactive-cd
)

# shellcheck source=/dev/null
source "${ZSH}/oh-my-zsh.sh"

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
export ARCHFLAGS="-arch arm64"

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

source "${ZSH}/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" &>/dev/null

# AGNOSTER_PROMPT_SEGMENTS=("prompt_git" "prompt_status" "prompt_virtualenv" "prompt_context" "prompt_dir" "prompt_git" "docker_context_prompt" "${AGNOSTER_PROMPT_SEGMENTS[@]}")
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
#     if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]];then
#         seq="$seq@%m"
#     fi
#     prompt_segment black default $seq
# }

# DEFAULT_USER=user@hostname
# export DEFAULT_USER="$(whoami)"

# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# prompt_segment() - Takes two arguments, background and foreground.
# Both can be omitted, rendering default background/foreground.

customize_agnoster() {
  prompt_segment 'red' '' ' ⚙ ⚡⚡⚡ ⚙  '
}

#PROMPT="%{%f%b%k%}%n%~%?"
#PROMPT='%B%F{240}%1~%f%b %# '

#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

autoload -U promptinit
promptinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_

zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# PS1="%K%n%k@%m:%~/ > "
# PS2="> "
# RPS1="%(?..(%?%))"

# PS1="%{%f%b%k%}$(build_prompt)"
# PS2="%_>"

function docker_context_prompt()
{
  PS1="context: $(docker version --format='{{.Client.Context}}')> "
}

PROMPT_COMMAND=docker_context_prompt

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion()
  {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
      COMP_LINE="$COMP_LINE" \
      COMP_POINT="$COMP_POINT" \
      npm completion -- "${words[@]}" \
      2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion()
  {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT - 1)) \
      COMP_LINE=$BUFFER \
      COMP_POINT=0 \
      npm completion -- "${words[@]}" \
      2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion()
  {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
      COMP_LINE="$line" \
      COMP_POINT="$point" \
      npm completion -- "${words[@]}" \
      2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

# complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
# fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

zstyle ':completion:*:*:make:*' tag-order 'targets'

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

autoload -U compinit && compinit

# /opt/homebrew/share/zsh/site-functions
# /opt/homebrew/Cellar/docker-completion/20.10.9

# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  # ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }


# # title bar prompt
# precmd () {
#   # print -Pn "\e]2; %~\a"
#   print -Pn "\e]2;%n@%M | %~\a"
# }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Finished. Restart your shell or reload config file.
# source ~/.bashrc  # bash  (.bashrc should be loaded from .bash_profile)
# source ~/.zshrc   # zsh



# To activate these completions, add the following to your .zshrc:

# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#   autoload -Uz compinit
#   compinit
# fi

# autoload -U compinstall && compinstall
# autoload -U compinit && compinit


# You may also need to force rebuild `zcompdump`:

# rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
# chmod -R go-w /opt/homebrew/share/zsh/

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh


export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
