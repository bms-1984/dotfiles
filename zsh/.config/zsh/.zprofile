eval $(gpg-connect-agent --quiet /bye)
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias rm='rm'
alias mkdir='nocorrect mkdir -p'

alias ls="ls --color=auto"
alias ll="ls --color -l"
alias la="ls --color -la"
alias lt="ls --sort=time"
alias lat="ls --color -la --sort=time"

alias rh='fc -R'
alias sbcl="rlwrap sbcl"
alias emacs="emacs -mm"

export EDITOR=emacs
export VISUAL=$EDITOR

alias src=". $ZDOTDIR/.zshrc"
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
