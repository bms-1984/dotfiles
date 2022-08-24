export GPG_TTY=$TTY
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GREP_OPTIONS='-color=auto'
export EDITOR=emacs
export VISUAL=$EDITOR
typeset -TUx PATH path
typeset -TUx INFOPATH infopath
typeset -TUx MANPATH manpath
path=($HOME/.local/bin $HOME/.local/sbin $path)
infopath=($HOME/.local/share/info /usr/local/share/info /usr/share/info $infopath)
manpath=($HOME/.local/share/man /usr/local/share/man /usr/share/man $manpath)

alias sbcl="rlwrap sbcl"
alias src="exec zsh"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias make="remake"

silent () {
  "$@" &>/dev/null </dev/null
}

hsync () {
    history_sync_pull
    printf "Ben\ny\ny\ny\n" | history_sync_push
}

update () {
    sudo pacman -Syu
    upgrade_oh_my_zsh_all
}
