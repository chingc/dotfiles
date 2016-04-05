#!/bin/bash


# Location of this script -- http://stackoverflow.com/questions/59895/
PROFILE_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Helpful git scripts -- https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
source "${PROFILE_HOME}/git-completion.sh"
source "${PROFILE_HOME}/git-prompt.sh"


# Is this a Mac?
is_osx() {
    if [ "$(uname -s)" == "Darwin" ]; then
        return 0  # this is run by the shell so zero means success
    else
        return 1
    fi
}


# Aliases
my_alias() {
    unalias -a

    if $(is_osx); then
        alias ls="ls -FGhl"
    else
        alias ls="ls -Fhl --color"
    fi

    alias grep="grep -E --color"
    alias reup="source ${PROFILE_HOME}/profile"
    alias vi="vim '+syntax on' '+set number'"
}


# JAVA_HOME
my_java() {
    if $(is_osx); then
        export JAVA_HOME="$(/usr/libexec/java_home)"
    else
        export JAVA_HOME="$(${PROFILE_HOME}/java_home)"
    fi
}


# Customize prompt -- http://misc.flogisoft.com/bash/tip_colors_and_formatting
my_prompt() {
    local esc='\[\033[0m\]'

    local black='\[\033[0;30m\]'
    local red='\[\033[0;31m\]'
    local green='\[\033[0;32m\]'
    local yellow='\[\033[0;33m\]'
    local blue='\[\033[0;34m\]'
    local magenta='\[\033[0;35m\]'
    local cyan='\[\033[0;36m\]'
    local white='\[\033[0;97m\]'

    local exit_status='$?'
    local history_number='\!'
    local time='\t'
    local user='\u'
    local host='\h'
    local workdir='\W'
    local prompt='\$'

    local git='$(__git_ps1)'  # from the helpful git scripts

    PS1="${yellow}${exit_status} ${history_number} ${time} ${user}@${host}:${workdir}${green}${git}${yellow}${prompt}${esc} "
}


# Additional profile settings
my_settings() {
    if [ -f $HOME/.my_settings ]; then
        source $HOME/.my_settings
    fi
}


my_alias
my_java
my_prompt
my_settings
