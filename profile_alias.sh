#!/bin/bash


is_macos() {
    if [ "$(uname -s)" == "Darwin" ]
    then
        return 0  # this is an exit code; zero is success
    else
        return 1
    fi
}

docker-dangles() {
    docker images -f "dangling=true" -q
}

reup() {
    brew update
    echo -e "\n"
    brew outdated
    brew cask outdated
    echo -e "\n"
    softwareupdate -l
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


# Work

alias be="bundle exec"
