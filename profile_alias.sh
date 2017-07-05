#!/bin/bash


is_macos() {
    if [ "$(uname -s)" == "Darwin" ]
    then
        return 0  # this is an exit code; zero is success
    else
        return 1
    fi
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

alias docker-dangles="docker images -f dangling=true -q"
