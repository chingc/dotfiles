#!/bin/bash


activate() {
    if [ -d .venv ]
    then
        # shellcheck disable=SC1091
        source .venv/bin/activate
        echo "venv: $(command -v python)"
    else
        echo "venv not found"
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
    python -m venv .venv
    activate
}

reup() {
    if is_macos
    then
        brew update
        echo "==> Brew Updates"
        brew outdated
        echo "==> Brew Cask Updates"
        brew cask outdated
        echo "==> System Updates"
        softwareupdate -l
    else
        echo "==> Software Updates"
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
