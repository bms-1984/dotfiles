export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bms"
plugins=(you-should-use autoupdate zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages command-not-found cp gpg-agent ssh-agent common-aliases git-prompt)
. $ZSH/oh-my-zsh.sh

export VISUAL=emacsclient
export EDITOR=emacsclient

alias gcc="ccache gcc"
alias x86_64-elf-gcc="ccache x86_64-elf-gcc"

alias -s {c,h,s,S,lisp,liz,el,conf}=emacsclient

stocal() {
    sudo stow --target=/usr/local --ignore='share' --ignore='cross' --dir=$HOME .local
    echo Done.
}

upgrade() {
#    sudo pacman -Syu --noconfirm
#    for file in $aurdir/*(/); do
#        echo Checking $file for updates.
#        cd $file
#        if ! gl
#        then
#            makepkg -si
#        fi
#	cd - > /dev/null
#    done
    sudo apt-get -y update
    sudo apt-get -y full-upgrade
    sudo apt-get -y autoremove
    omz update
    upgrade_oh_my_zsh_custom
    echo Done.
}

push() {
    gaa
    gcmsg "$1"
    gp
    echo Done.
}

rm~() {
    find . -depth -name "*~" -print -delete
    echo Done.
}
