###.zshenv was last modified on September 14, 2022 at 10:28 PM EDT by bms###
# environment variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.xdg
export GPG_TTY=${TTY:-$(tty)}
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GREP_OPTIONS=-color=auto
export EDITOR=emacs
export VISUAL=$EDITOR
export TZ="EST+5EDT,M3.2.0/2,M11.1.0/2"

typeset -TUx PATH path
typeset -TUx INFOPATH infopath
typeset -TUx MANPATH manpath
typeset -TUx PKG_CONFIG_PATH pkgconfigpath
typeset -TUx GUILE_LOAD_PATH guileloadpath
typeset -TUx GUILE_LOAD_COMPILED_PATH guileloadcompiledpath

path=(/usr/lib/ccache/bin $HOME/.local/bin
      $HOME/.local/sbin
      $path)
infopath=($HOME/.local/share/info /usr/local/share/info
	  /usr/share/info
	  $infopath)
manpath=($HOME/.local/share/man /usr/local/share/man
	 /usr/share/man
	 $manpath)
pkgconfigpath=($HOME/.local/lib/pkgconfig $HOME/.local/share/pkgconfig
	       /usr/local/lib/pkgconfig /usr/local/share/pkgconfig
	       /usr/lib/pkgconfig /usr/share/pkgconfig
	       $pkgconfigpath)
guileloadpath=($HOME/.local/share/guile/site/3.0
	       $guileloadpath)
guileloadcompiledpath=($HOME/.local/lib/guile/3.0/site-ccache
		       $guileloadcompiledpath)
fpath=($ZDOTDIR/functions
       $fpath)
fignore=(\~)

# end
