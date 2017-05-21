#!/bin/bash


ANDROID_HOME="/usr/local/opt/android-sdk"

if is_macos
then
    JAVA_HOME="$(/usr/libexec/java_home)"
else
    JAVA_HOME="$(${PROFILE_HOME}/java_home)"
fi

JAVA_OPTS="-Xmx2G"

JRUBY_HOME=${HOME}/Applications/jruby

BASE_PATH="${BASE_PATH:-${PATH}}"  # prevent path from growing larger every time this is sourced
PATH="${JRUBY_HOME}/bin:${BASE_PATH}"

export ANDROID_HOME
export JAVA_OPTS
export JAVA_HOME
export PATH

export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTFILESIZE=9999
export HISTSIZE=9999
