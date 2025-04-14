# Location: ~/.zshrc

alias grep='grep --color --extended-regexp'
alias sed='sed -E'
alias la='ls -Fhla --color'
alias ll='ls -Fhl --color'
alias ls='ls -Fh --color'
alias vi='nvim'

cprint() {
    # Args: xterm color number, string
    # Example: cprint 46 hello world
    # Reference: https://www.ditig.com/256-colors-cheat-sheet
    print -P '%F{${1}}${@:2}%f'
}

cprintn() {
    # Same as cprint() but no newline.
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

eval "$(starship init zsh)"
