#!/bin/sh
#emacs.sh was last modified on September 24, 2022 at 05:17 PM EDT by bms#
systemctl is-active --user --quiet emacs || systemctl restart --user --quiet emacs
case "$*" in
    *-t*|*-nw*) cmd="(memq 't (mapcar 'framep (frame-list)))" ;; # if != nil, there are tty frames
    *) cmd="(delete 't (mapcar 'framep (frame-list)))" ;; # if != nil, there are graphical terminals (x, w32, ns)
esac
frames="$(emacsclient -a '' -n -e "$cmd" 2>/dev/null |sed 's/.*\x07//g' )"
if [ -z "$frames" ] || [ "$frames" = nil ]; then
    emacsclient --no-wait --create-frame $1
else
    emacsclient --no-wait $1
fi
#end
