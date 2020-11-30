export ZSH="/home/bms/.oh-my-zsh"
ZSH_THEME="bms"
plugins=(you-should-use autoupdate zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages command-not-found cp gpg-agent ssh-agent common-aliases emacs git-prompt)
. $ZSH/oh-my-zsh.sh

export EDITOR="emacs"

alias gcc="ccache gcc"
alias x86_64-elf-gcc="ccache x86_64-elf-gcc"

alias -s {c,h,s,S,lisp,liz}=emacs
