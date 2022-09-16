#!/bin/sh
###emacscheck.sh was last modified on September 15, 2022 at 10:40 PM EDT by bms###

# if systemd unit emacs is not running, start it
systemctl is-active --user --quiet emacs || systemctl restart --user --quiet emacs

# got this from oh-my-zsh's emacs plugin: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/emacs/emacsclient.sh
# Adapted from https://github.com/davidshepherd7/emacs-read-stdin/blob/master/emacs-read-stdin.sh
# If the second argument is - then write stdin to a tempfile and open the
# tempfile. (first argument will be `--no-wait` passed in by the plugin.zsh)
case "$*" in
    *-t*|*-nw*) cmd="(memq 't (mapcar 'framep (frame-list)))" ;; # if != nil, there are tty frames
    *) cmd="(delete 't (mapcar 'framep (frame-list)))" ;; # if != nil, there are graphical terminals (x, w32, ns)
esac
frames="$(emacsclient -a '' -n -e "$cmd" 2>/dev/null |sed 's/.*\x07//g' )"

# if frames exist, join them, if not create one
if [ -z "$frames" ] || [ "$frames" = nil ]; then
    emacsclient --no-wait --alternate-editor "" --create-frame $1
else
    emacsclient --no-wait --alternate-editor "" $1
fi
# end
