###.zshrc was last modified on September 18, 2022 at 11:54 PM EDT by bms###
# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ohmyzsh setup
LISTMAX=0
LOGCHECK=60
HISTSIZE=20000
MAILCHECK=1
READNULLCMD=less
REPORTTIME=15
SAVEHIST=30000000
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'
watch=(all)
WATCHFMT='%n %a %l from %m at %t.'
WORDCHARS="${WORDCHARS:s#/#}"
DIRSTACKSIZE=60

# ohmyzsh
export ZSH="$ZDOTDIR/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.dotfiles/zsh-custom"
ZSH_CUSTOM_AUTOUPDATE_QUIET=true
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 1
plugins=(command-not-found colorize cp gpg-agent \
			   history  autoupdate send solarized-man \
			   zsh-autosuggestions fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# options
setopt \
    auto_cd \
    cdable_vars \
    cd_silent \
    pushd_ignore_dups \
    pushd_to_home \
    no_beep \
    interactive_comments \
    combining_chars \
    multios \
    csh_null_glob \
    extended_glob \
    extended_history \
    no_glob_dots \
    hist_allow_clobber \
    hist_find_no_dups \
    no_hist_ignore_all_dups \
    hist_ignore_dups \
    hist_reduce_blanks \
    no_hist_save_no_dups \
    inc_append_history \
    no_list_ambiguous \
    long_list_jobs \
    magic_equal_subst \
    no_notify \
    prompt_subst \
    rc_quotes \
    no_share_history \
    shwordsplit \
    transient_rprompt \
    hist_ignore_space \
    no_equals

autoload -Uz start ustart stop ustop restart urestart status ustatus

source /usr/share/doc/find-the-command/ftc.zsh
source <(cod init $$ zsh)
# gpg agent is annoying
eval $(gpg-connect-agent --quiet /bye)
# p10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# nice aliases
alias sbcl="rlwrap sbcl"
alias src="exec zsh"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias zenv="$EDITOR $ZDOTDIR/.zshenv"
alias zenv_="$EDITOR $HOME/.zshenv"
alias zlog="$EDITOR $ZDOTDIR/.zlogin"
alias make="remake"
alias pacman="pacman --color=always"
alias ssh="ssh -F $CONFIG/ssh/config"
alias icat="kitty +kitten icat"
alias emacs="$SCRIPTS/emacscheck.sh"
alias e="emacs"
alias neofetch="neofetch --kitty --source $DOTFILES/arch.png"
alias mkdir="mkdir -p"
alias guile="guile -q -l $CONFIG/guile/init"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
# end
