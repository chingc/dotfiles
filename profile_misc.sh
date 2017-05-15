#!/bin/bash


if is_macos
then
    export JAVA_HOME="$(/usr/libexec/java_home)"
else
    export JAVA_HOME="$("${PROFILE_HOME}/java_home")"
fi
