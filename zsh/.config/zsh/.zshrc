#.zshrc was last modified on September 19, 2022 at 05:35 PM EDT by bms#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
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
[[ -f $ZDOTDIR/omz.zsh ]] && source $ZDOTDIR/omz.zsh
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
eval $(gpg-connect-agent --quiet /bye)
source <(cod init $$ zsh)
[[ -f /usr/share/doc/find-the-command/ftc.zsh ]] && source /usr/share/doc/find-the-command/ftc.zsh
[[ -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh
[[ -f $ZDOTDIR/aliases.zsh ]] && source $ZDOTDIR/aliases.zsh
# end
