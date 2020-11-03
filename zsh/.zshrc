#zsh home directory and custom theme
export ZSH="/home/bms/.oh-my-zsh"
ZSH_THEME="bms"

typeset -TUx PATH path
typeset -TUx EMACSLOADPATH emacsloadpath
typeset -TUx INFOPATH infopath
typeset -TUx XDG_DATA_DIRS xdg_data_dirs
typeset -TUx ACLOCAL_PATH aclocal_path
typeset -TUx LIBRARY_PATH library_path
typeset -TUx C_INCLUDE_PATH c_include_path
typeset -TUx CPLUS_INCLUDE_PATH cplus_include_path

path=($HOME/.local/bin $path)

# zsh plugins
plugins=(you-should-use autoupdate zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages command-not-found cp gpg-agent ssh-agent github gitignore common-aliases emacs git-prompt git-flow mosh )
. $ZSH/oh-my-zsh.sh

# emacs alias points here anyway
export EDITOR="$ZSH/plugins/emacs/emacsclient.sh --no-wait"

# convenience aliases to force ccache usage
alias gcc="ccache gcc"
alias cc="ccache cc"
alias g++="ccache g++"
alias c++="ccache c++"

# fixes zsh history files if they become corrupted
histfix
