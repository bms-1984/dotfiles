#!/bin/sh
#emacscheck.sh was last modified on September 19, 2022 at 05:22 PM EDT by bms#
systemctl is-active --user --quiet emacs || systemctl restart --user --quiet emacs
emacsclient --no-wait --alternate-editor "" --create-frame $1
#end
