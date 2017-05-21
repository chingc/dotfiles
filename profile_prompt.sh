#!/bin/bash


my_prompt() {
    local esc='\[\e[0m\]'

    # local black='\[\e[30m\]'
    # local red='\[\e[31m\]'
    local green='\[\e[32m\]'
    local yellow='\[\e[33m\]'
    # local blue='\[\e[34m\]'
    # local magenta='\[\e[35m\]'
    # local cyan='\[\e[36m\]'

    # local light_gray='\[\e[37m\]'
    # local dark_gray='\[\e[90m\]'
    # local light_red='\[\e[91m\]'
    # local light_green='\[\e[92m\]'
    # local light_yellow='\[\e[93m\]'
    # local light_blue='\[\e[94m\]'
    # local light_magenta='\[\e[95m\]'
    # local light_cyan='\[\e[96m\]'
    # local white='\[\e[97m\]'

    local exit_status='$?'
    local history_number='\!'
    local time='\t'
    local user='\u'
    local host='\h'
    local workdir='\W'
    local prompt='\$'

    # Customize prompt -- http://misc.flogisoft.com/bash/tip_colors_and_formatting
    export PS1="${yellow}${exit_status} ${history_number} ${time} ${user}@${host}:${workdir}${green}\$(__git_ps1)${yellow}${prompt}${esc} "
}

# Helpful git scripts -- https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
source "${PROFILE_HOME}/git-completion.bash"
source "${PROFILE_HOME}/git-prompt.sh"

my_prompt
