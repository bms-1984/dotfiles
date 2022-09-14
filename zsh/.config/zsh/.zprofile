export GPG_TTY=$TTY
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GREP_OPTIONS='-color=auto'
export EDITOR=emacs
export VISUAL=$EDITOR
typeset -TUx PATH path
typeset -TUx INFOPATH infopath
typeset -TUx MANPATH manpath
typeset -TUx PKG_CONFIG_PATH pkgconfigpath
typeset -TUx GUILE_LOAD_PATH guileloadpath
typeset -TUx GUILE_LOAD_COMPILED_PATH guileloadcompiledpath
path=(/usr/lib/ccache/bin $HOME/.local/bin $HOME/.local/sbin $path)
infopath=($HOME/.local/share/info /usr/local/share/info /usr/share/info $infopath)
manpath=($HOME/.local/share/man /usr/local/share/man /usr/share/man $manpath)
pkgconfigpath=($HOME/.local/lib/pkgconfig $HOME/.local/share/pkgconfig /usr/local/lib/pkgconfig /usr/local/share/pkgconfig /usr/lib/pkgconfig /usr/share/pkgconfig $pkgconfigpath)
guileloadpath=($HOME/.local/share/guile/site/3.0 $guileloadpath)
guileloadcompiledpath=($HOME/.local/lib/guile/3.0/site-ccache/ $guileloadcompiledpath)

alias sbcl="rlwrap sbcl"
alias src="exec zsh"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc &"
alias zpr="$EDITOR $ZDOTDIR/.zprofile &"
alias zenv="$EDITOR $ZDOTDIR/.zshenv &"
alias make="remake"
alias pacman="pacman --color=always"
alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"
alias e="emacs"

emacs () {
    emacscheck.sh $@ &
}

silent () {
  "$@" &>/dev/null </dev/null
}
