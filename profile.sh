#!/bin/bash


# Is this macOS?
is_macos() {
    if [ "$(uname -s)" == "Darwin" ]
    then
        return 0  # the shell considers zero to be true/success
    else
        return 1
    fi
}

# Location of this script -- http://stackoverflow.com/questions/59895/
PROFILE_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PROFILE_HOME

source "${PROFILE_HOME}/profile_alias.sh"
source "${PROFILE_HOME}/profile_export.sh"
source "${PROFILE_HOME}/profile_prompt.sh"
