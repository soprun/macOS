#!/bin/bash

# PROMPT

# default macOS prompt is: \h:\W \u\$

# assemble the prompt string PS1
# inspired from: https://stackoverflow.com/a/16715681
function __build_prompt {
    local EXIT="$?" # store current exit code
    
    # define some colors
    local RESET='\[\e[0m\]'
    local RED='\[\e[0;31m\]'
    local GREEN='\[\e[0;32m\]'
    local BOLD_GRAY='\[\e[1;30m\]'
    # longer list of codes here: https://unix.stackexchange.com/a/124408
    
    # start with an empty PS1
    PS1=""

    if [[ $EXIT -eq 0 ]]; then
        PS1+="${GREEN}√${RESET} "      # Add green for success
    else
        PS1+="${RED}?️️️${EXIT}${RESET} " # Add red if exit code non 0
    fi
    # this is the default prompt for 
    PS1+="${BOLD_GRAY}\W ${RESET}\$ "
}

# set the prompt command
# include previous values to maintain Apple Terminal support (window title path and sessions)
# this is explained in /etc/bashrc_Apple_Terminal
PROMPT_COMMAND="__build_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
