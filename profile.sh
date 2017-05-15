#!/bin/bash


export EDITOR=vi
export HISTCONTROL=ignoreboth
export HISTFILESIZE=9999
export HISTSIZE=9999

# Location of this script -- http://stackoverflow.com/questions/59895/
export PROFILE_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Is this macOS?
is_macos() {
    if [ "$(uname -s)" == "Darwin" ]
    then
        return 0  # the shell considers zero to be true/success
    else
        return 1
    fi
}

source "${PROFILE_HOME}/profile_alias.sh"
source "${PROFILE_HOME}/profile_prompt.sh"

if [ -f "${PROFILE_HOME}/profile_misc.sh" ]
then
    source "${PROFILE_HOME}/profile_misc.sh"
fi
