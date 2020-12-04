export ZSH="/home/bms/.oh-my-zsh"
ZSH_THEME="bms"
plugins=(you-should-use autoupdate zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages command-not-found cp gpg-agent ssh-agent common-aliases emacs git-prompt)
. $ZSH/oh-my-zsh.sh

export EDITOR="emacs"
export store=$HOME/.store
export aurdir=$store/aur
export dldir=$store/dl
export audir=$store/sound
export imgdir=$store/img
export docdir=$store/docs
export viddir=$store/vid
export waredir=$store/ware
export projdir=$store/projects

alias gcc="ccache gcc"
alias x86_64-elf-gcc="ccache x86_64-elf-gcc"

alias -s {c,h,s,S,lisp,liz}=emacs

stocal() {
    sudo stow --target=/usr/local --ignore='share' --ignore='cross' --dir=$HOME .local
    echo Done.
}

upgrade() {
    sudo pacman -Syu --noconfirm
    for file in $aurdir/*(/); do
        echo Checking $file for updates.
        cd $file
        if ! gl
        then
            makepkg -si
        fi
	cd - > /dev/null
    done
    upgrade_oh_my_zsh
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
