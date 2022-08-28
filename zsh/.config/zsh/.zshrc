# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.dotfiles/zsh-custom"
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 1
COMPLETION_WAITING_DOTS="true"

plugins=(git github command-not-found colorize cp gpg-agent \
	     history archlinux systemd history-sync autoupdate \
	     copyzshell send solarized-man emacs zsh-autosuggestions \
	     zsh-aliases-lsd fast-syntax-highlighting)

ZSH_CUSTOM_AUTOUPDATE_QUIET=true
source $ZSH/oh-my-zsh.sh

DIRSTACKSIZE=60
fpath=($ZDOTDIR/functions $fpath)
autoload -U $ZDOTDIR/functions/*(:t)
fignore=(\~)

LISTMAX=0
LOGCHECK=60
HISTSIZE=20000
HISTFILE=$ZDOTDIR/.history
MAILCHECK=1
READNULLCMD=less
REPORTTIME=15
SAVEHIST=30000000
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'
watch=(all)
WATCHFMT='%n %a %l from %m at %t.'
WORDCHARS="${WORDCHARS:s#/#}"

export ZSH_HISTORY_FILE=$HISTFILE
export ZSH_HISTORY_PROJ=$HOME/.dotfiles/zhistory
export ZSH_HISTORY_FILE_ENC=$HOME/.dotfiles/zhistory/zhistory.gpg

setopt \
  auto_cd \
  multios \
  interactive_comments \
  combining_chars \
  auto_pushd \
  auto_name_dirs \
  auto_resume \
  no_beep \
  cdable_vars \
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
  no_list_beep \
  long_list_jobs \
  magic_equal_subst \
  no_notify \
  prompt_subst \
  pushd_minus \
  pushd_silent \
  pushd_to_home \
  rc_quotes \
  no_share_history \
  shwordsplit \
  transient_rprompt \
  hist_ignore_space \
  no_equals \

eval $(gpg-connect-agent --quiet /bye)
  
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
