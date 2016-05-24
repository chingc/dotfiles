#!/bin/bash


# Bash settings
export EDITOR=vi
export HISTCONTROL=ignoreboth
export HISTFILESIZE=9999
export HISTSIZE=9999


# Location of this script -- http://stackoverflow.com/questions/59895/
export PROFILE_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Is this Mac OS X?
is_osx() {
    if [ "$(uname -s)" == "Darwin" ]; then
        return 0  # this is run by the shell so zero is true/success
    else
        return 1
    fi
}


# Aliases
my_alias() {
    unalias -a

    if is_osx; then
        alias ls='ls -FGhl'
    else
        alias ls='ls -Fhl --color'
    fi

    alias grep='grep -E --color'
    alias vi='vim "+syntax on" "+set number"'
    alias vim='vim "+syntax on" "+set number"'
}


# JAVA_HOME
my_java() {
    if is_osx; then
        export JAVA_HOME="$(/usr/libexec/java_home)"
    else
        export JAVA_HOME="$("${PROFILE_HOME}/java_home")"
    fi

    export JDK_HOME="${JAVA_HOME}"
    export JRE_HOME="${JAVA_HOME}"
}


# Customize prompt -- http://misc.flogisoft.com/bash/tip_colors_and_formatting
my_prompt() {
    local esc='\[\e[0m\]'

    local black='\[\e[30m\]'
    local red='\[\e[31m\]'
    local green='\[\e[32m\]'
    local yellow='\[\e[33m\]'
    local blue='\[\e[34m\]'
    local magenta='\[\e[35m\]'
    local cyan='\[\e[36m\]'

    local light_gray='\[\e[37m\]'
    local dark_gray='\[\e[90m\]'
    local light_red='\[\e[91m\]'
    local light_green='\[\e[92m\]'
    local light_yellow='\[\e[93m\]'
    local light_blue='\[\e[94m\]'
    local light_magenta='\[\e[95m\]'
    local light_cyan='\[\e[96m\]'
    local white='\[\e[97m\]'

    local exit_status='$?'
    local history_number='\!'
    local time='\t'
    local user='\u'
    local host='\h'
    local workdir='\W'
    local prompt='\$'

    # Helpful git scripts -- https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
    source "${PROFILE_HOME}/git-completion.sh"
    source "${PROFILE_HOME}/git-prompt.sh"

    export PS1="${yellow}${exit_status} ${history_number} ${time} ${user}@${host}:${workdir}${green}\$(__git_ps1)${yellow}${prompt}${esc} "
}


# Additional profile settings
my_settings() {
    if [ -f "${HOME}/.my_settings" ]; then
        source "${HOME}/.my_settings"
    fi
}


my_alias
my_java
my_prompt
my_settings
