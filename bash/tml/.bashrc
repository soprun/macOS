# ENVIRONMENT VARIABLES

export EDITOR="atom --wait"

# add my ~/bin dir to path
PATH=${PATH}:~/bin
export PATH

# simple prompt
# default macOS prompt is: \h:\W \u\$
export PS1="\W \$ "
export PS1="\[\e[1;30m\]\W\[\e[m\] \\$ "

# enable Terminal color
export CLICOLOR=1


###


#if [[ -r ~/.bashrc ]]; then
#  source ~/.bashrc
#fi

# ENVIRONMENT VARIABLES

# export EDITOR="atom --wait"

# add my ~/bin dir to path
# PATH=${PATH}:~/bin
# export PATH

# simple prompt
# default macOS prompt is: \h:\W \u\$
# export PS1="\W \$ "
# export PS1="\[\e[1;30m\]\W\[\e[m\] \\$ "

# export PS1="\[\e[92;40m\]\h\[\e[m\]:\[\e[93m\]\W\[\e[m\] \\$ "

# enable Terminal color
# export CLICOLOR=1


# prints colored text
print_style () {

    if [ "$2" == "info" ] ; then
        COLOR="96m";
    elif [ "$2" == "success" ] ; then
        COLOR="92m";
    elif [ "$2" == "warning" ] ; then
        COLOR="93m";
    elif [ "$2" == "danger" ] ; then
        COLOR="91m";
    else #default color
        COLOR="0m";
    fi

    STARTCOLOR="\e[$COLOR";
    ENDCOLOR="\e[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1";
}
