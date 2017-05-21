#!/bin/bash


unalias -a

if is_macos
then
    alias ls='ls -FGhl'
else
    alias ls='ls -Fhl --color'
fi

alias be="bundle exec"

alias docker-dangles="docker images -f 'dangling=true' -q"

alias grep='grep -E --color'

alias vi='vim "+syntax on" "+set number"'
alias vim='vim "+syntax on" "+set number"'
