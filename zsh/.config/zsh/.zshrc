source $ZDOTDIR/.zshenv

LISTMAX=0
LOGCHECK=60
HISTSIZE=20000
READNULLCMD=less
REPORTTIME=15
SAVEHIST=30000000
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'
watch=(all)
WATCHFMT='%n %a %l from %m at %t.'
WORDCHARS="${WORDCHARS:s#/#}"
DIRSTACKSIZE=60
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
source $ZDOTDIR/aliases.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autopair/autopair.zsh
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
source $ZDOTDIR/.iterm2_shell_integration.zsh

