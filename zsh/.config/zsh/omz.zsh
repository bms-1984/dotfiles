#omz.zsh was last modified on September 25, 2022 at 11:35 AM EDT by bms#
export ZSH="${ZDOTDIR:-$HOME/.config/zsh}/oh-my-zsh"
export ZSH_CUSTOM="${ZDOTDIR:-$HOME/.config/zsh}/custom"
ZSH_CACHE_DIR="${CACHE:-$HOME/.cache}/omz"
ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="mm/dd/yyyy"
zstyle ':omz:update' mode disabled
plugins=(command-not-found colorize cp gpg-agent \
			   history zsh-256color \
			   zsh-autosuggestions zsh-kitty \
			   fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
#end
