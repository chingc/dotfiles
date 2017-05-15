#!/bin/bash


unalias -a

alias grep='grep -E --color'
alias vi='vim "+syntax on" "+set number"'
alias vim='vim "+syntax on" "+set number"'

if is_macos
then
    alias ls='ls -FGhl'
else
    alias ls='ls -Fhl --color'
fi
