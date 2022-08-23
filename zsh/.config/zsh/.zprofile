eval $(gpg-connect-agent --quiet /bye)
export GPG_TTY=$TTY
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

alias sbcl="rlwrap sbcl"

export EDITOR=emacs
export VISUAL=$EDITOR

alias src="exec zsh"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"

typeset -TUx PATH path
typeset -TUx INFOPATH infopath
typeset -TUx MANPATH manpath

path=($HOME/.local/bin $HOME/.local/sbin $path)
infopath=($HOME/.local/share/info /usr/local/share/info /usr/share/info $infopath)
manpath=($HOME/.local/share/man /usr/local/share/man /usr/share/man $manpath)

silent() {
  "$@" &>/dev/null </dev/null
}

rm~() {
  find . -name "^*~$" -delete
}
