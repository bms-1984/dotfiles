eval $(/opt/homebrew/bin/brew shellenv)

export GPG_TTY="${TTY:-$(tty)}"
export EDITOR=emacs
export VISUAL="$EDITOR"
export TZ="EST+5EDT,M3.2.0/2,M11.1.0/2"
export HISTORY="$HOME/.history"
export DOTFILES="$HOME/.dotfiles"
export CONFIG="$HOME/.config"
export CACHE="$HOME/.cache"
export LOCAL="$HOME/.local"
export DATA="$LOCAL/share"
export XDG="$CACHE/xdg"
export XDG_CONFIG_HOME="$CONFIG"
export XDG_CACHE_HOME="$CACHE"
export XDG_DATA_HOME="$DATA"
export XDG_RUNTIME_DIR="$XDG"
export GIT_SSH_COMMAND="ssh -F $CONFIG/ssh/config"
export HISTFILE="$HISTORY/zsh"
export LESSHISTFILE="-"
export LESS="-R --use-color"
export GNUPGHOME="$CONFIG/gnupg"
export MAKEFLAGS="-j5 $MAKEFLAGS"
export CFLAGS="-fanalyzer -fstack-check -fstack-protector-strong -fverbose-asm -Wall -Wextra -march=native -std=c11 $CFLAGS"
export LDFLAGS="--fatal-warnings --gc-sections $LDFLAGS"
typeset -TUx PATH path
typeset -TUx INFOPATH infopath
typeset -TUx MANPATH manpath
typeset -TUx PKG_CONFIG_PATH pkgconfigpath
typeset -Ux fpath
path=( \
	$LOCAL/bin \
	/opt/homebrew/opt/ccache/libexec \
	/Library/Frameworks/Python.framework/Versions/3.11/bin \
	/opt/gradle/gradle-8.7/bin \
	$path)
infopath=( \
	$LOCAL/share/info \
	/usr/share/info \
	$infopath)
manpath=( \
	$LOCAL/share/man \
	/usr/local/share/man \
	/usr/share/man \
	$manpath)
pkgconfigpath=( \
	$LOCAL/lib/pkgconfig \
	$LOCAL/share/pkgconfig \
	/usr/lib/pkgconfig \
	/usr/share/pkgconfig \
	$pkgconfigpath)
fpath=( \
    ${ZDOTDIR:-$CONFIG/zsh}/functions \
    $fpath)
fignore=(\~)
