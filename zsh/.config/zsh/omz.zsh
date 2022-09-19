#omz.zsh was last modified on September 19, 2022 at 07:09 PM EDT by bms#
export ZSH="$ZDOTDIR/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.dotfiles/zsh-custom"
ZSH_CUSTOM_AUTOUPDATE_QUIET=true
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 1
plugins=(command-not-found colorize cp gpg-agent \
			   history  autoupdate send solarized-man \
			   zsh-256color zsh-autosuggestions zsh-kitty fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
#end
