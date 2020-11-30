# zsh home directory and custom theme
export ZSH="/home/bms/.oh-my-zsh"
ZSH_THEME="bms"

typeset -TUx PATH path
path=($HOME/.local/sbin $HOME/.local/bin $path)

# zsh plugins
plugins=(you-should-use autoupdate zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages command-not-found cp gpg-agent ssh-agent common-aliases emacs git-prompt)
. $ZSH/oh-my-zsh.sh

# emacs alias points here anyway
export EDITOR="$ZSH/plugins/emacs/emacsclient.sh --no-wait"

# convenience aliases to force ccache usage
alias gcc="ccache gcc"
alias cc="ccache cc"
alias g++="ccache g++"
alias c++="ccache c++"
alias x86_64-elf-gcc="ccache x86_64-elf-gcc"

alias -s {c,h,s,S,lisp,liz}=emacs
