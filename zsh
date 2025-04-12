# Config location: .zshrc

alias grep='grep --color --extended-regexp'
alias sed='sed -E'
alias la='ls -Fhla --color'
alias ll='ls -Fhl --color'
alias ls='ls -Fh --color'
alias vi='nvim'

cprint() {
    # colors: https://jonasjacek.github.io/colors/
    # args are the color code followed by the text to print
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
