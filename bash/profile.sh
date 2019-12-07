#!/bin/bash


profile_home() {
    # location of this script: https://stackoverflow.com/a/246128/4399354
    # shellcheck disable=SC2005
    echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
}

# shellcheck disable=SC1090
{
    source "$(profile_home)/profile_alias.sh"
    source "$(profile_home)/profile_path.sh"
    source "$(profile_home)/profile_prompt.sh"
}

export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTFILESIZE=9999
export HISTSIZE=

shopt -s globstar
