#!/bin/bash


activate() {
    if [ -d .venv ]
    then
        # shellcheck disable=SC1091
        source .venv/bin/activate
        echo "venv: $(command -v python)"
    else
        echo "venv: not found"
        return 1
    fi
}

cd() {
    builtin cd "$@" || return
    if [ -d .venv ]
    then
        deactivate 2>/dev/null
        activate
    fi
}

is_macos() {
    if [ "$(uname -s)" == "Darwin" ]
    then
        return 0
    else
        return 1
    fi
}

mkvenv() {
    python3 -m venv .venv
    activate
}

repeat() {
    for n in $(seq "${1}")
    do
        echo ">>> Run ${n}/${1}"
        "${@:2}"
    done
}

reup() {
    if is_macos
    then
        brew update
        printf "\n\033[0;34m==>\033[0m Brew Updates\n"
        brew outdated
        printf "\n\033[0;34m==>\033[0m Brew Cask Updates\n"
        brew outdated --cask
        printf "\n\033[0;34m==>\033[0m System Updates\n"
        softwareupdate -l
    else
        printf "\n\033[0;34m==>\033[0m Software Updates\n"
        sudo apt-get update
        sudo apt-get -u upgrade --assume-no
    fi
}


unalias -a

if is_macos
then
    alias ls="ls -FGhl"
else
    alias ls="ls -Fhl --color"
fi

alias grep="grep -E --color"

alias vi="vim"
