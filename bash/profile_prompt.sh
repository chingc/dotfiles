#!/bin/bash


# shellcheck disable=SC1091
{
    source /usr/local/etc/bash_completion.d/git-completion.bash
    source /usr/local/etc/bash_completion.d/git-prompt.sh
}

my_prompt() {
    local esc='\[\033[0m\]'
    # local gray='\[\033[1;30m\]'
    # local red='\[\033[1;31m\]'
    local green='\[\033[1;32m\]'
    local yellow='\[\033[1;33m\]'
    local blue='\[\033[1;34m\]'
    # local magenta='\[\033[1;35m\]'
    # local cyan='\[\033[1;36m\]'
    # local white='\[\033[1;37m\]'

    # customize prompt: http://misc.flogisoft.com/bash/tip_colors_and_formatting
    PS1="${yellow}[\A "'${CMD_RUNTIME}s'" \$?] \u ${blue}\w${green}"'$(__git_ps1)'"${yellow} \$${esc} "
}

cmd_timer_start() {
    CMD_TIMER_START=${CMD_TIMER_START:-$SECONDS}
}

cmd_timer_stop() {
  CMD_RUNTIME=$((SECONDS - CMD_TIMER_START))
  unset CMD_TIMER_START
}

# command timer: https://stackoverflow.com/a/1862762/4399354
trap 'cmd_timer_start' DEBUG
PROMPT_COMMAND=cmd_timer_stop

my_prompt
