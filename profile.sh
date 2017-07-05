#!/bin/bash


profile_home() {
    # Location of this script -- http://stackoverflow.com/questions/59895/
    # shellcheck disable=SC2005
    echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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
