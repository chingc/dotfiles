# Config location: .zshrc

alias grep='grep --color --extended-regexp'
alias sed='sed -E'
alias la='ls -Fhla --color'
alias ll='ls -Fhl --color'
alias ls='ls -Fh --color'
alias vi='nvim'

cprint() {
    # args: the xterm color number followed by the text
    # example: cprint 46 hello world
    # reference: https://www.ditig.com/256-colors-cheat-sheet
    print -P '%F{${1}}${@:2}%f'
}

cprintn() {
    # same as cprint but no newline
    print -nP '%F{${1}}${@:2}%f'
}

is_macos() {
    if [[ "$(uname -s)" == "Darwin" ]]
    then
        return 0
    else
        return 1
    fi
}
