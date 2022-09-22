#.zshenv was last modified on September 21, 2022 at 09:01 PM EDT by bms#
export MAIL=$HOME/.mail
export GPG_TTY=${TTY:-$(tty)}
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GREP_OPTIONS="--color=auto -n"
export EDITOR=emacs
export VISUAL=${EDITOR:-emacs}
export TZ="EST+5EDT,M3.2.0/2,M11.1.0/2"
export HISTORY=$HOME/.history
export DOTFILES=$HOME/.dotfiles
export SCRIPTS=$HOME/.scripts
export SRC=$HOME/.sources
export BUILD=$SRC/build
export AUR=$BUILD/aur
export REPO=$SRC/packages
export ORG=$HOME/.organization
export LOCAL=$HOME/.local
export CONFIG=$HOME/.config
export CACHE=$HOME/.cache
export DATA=$LOCAL/share
export XDG=$CACHE/xdg
export XDG_CONFIG_HOME=$CONFIG
export XDG_CACHE_HOME=$CACHE
export XDG_DATA_HOME=$DATA
export XDG_RUNTIME_DIR=$XDG
export GIT_SSH_COMMAND="ssh -F $CONFIG/ssh/config"
export WGETRC=$CONFIG/wget/rc
export GUILE_HISTORY=$HISTORY/guile
export HISTFILE=$HISTORY/zsh
export LESSHISTFILE="-"
export LESS="-R --use-color"
export RUSTUP_HOME=$DATA/rustup
export NPM_CONFIG_USERCONFIG=$CONFIG/npm/npmrc
export CARGO_HOME=$CONFIG/cargo
export GNUPGHOME=$CONFIG/gnupg
export XINITRC=$CONFIG/x/initrc
export MAKEFLAGS="-j$(nproc) $MAKEFLAGS"
export CFLAGS="-fanalyzer -fstack-check -fstack-protector-strong -fverbose-asm -Wall -Wextra -march=native -std=c11 $CFLAGS"
export LDFLAGS="--fatal-warnings --gc-sections"
export DIFFPROG="delta"
export PASSWORD_STORE_DIR=$CONFIG/pass/store
export NOTMUCH_CONFIG=$CONFIG/notmuch/config
typeset -TUx PATH path
typeset -TUx INFOPATH infopath
typeset -TUx MANPATH manpath
typeset -TUx PKG_CONFIG_PATH pkgconfigpath
typeset -TUx GUILE_LOAD_PATH guileloadpath
typeset -TUx GUILE_LOAD_COMPILED_PATH guileloadcompiledpath
typeset -Ux fpath
path=($SCRIPTS /usr/lib/ccache/bin $path)
infopath=(/usr/share/info $infopath)
manpath=(/usr/local/share/man /usr/share/man $manpath)
pkgconfigpath=(/usr/lib/pkgconfig /usr/share/pkgconfig $pkgconfigpath)
guileloadpath=($DATA/guile/site/3.0 $guileloadpath)
fpath=($ZDOTDIR/functions $fpath)
fignore=(\~)
#end
