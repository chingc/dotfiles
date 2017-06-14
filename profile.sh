#!/bin/bash


# Location of this script -- http://stackoverflow.com/questions/59895/
PROFILE_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PROFILE_HOME

source "${PROFILE_HOME}/profile_alias.sh"
source "${PROFILE_HOME}/profile_export.sh"
source "${PROFILE_HOME}/profile_prompt.sh"
