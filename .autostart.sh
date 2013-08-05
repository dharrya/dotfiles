#!/bin/sh

setxkbmap "us,ru" ",winkeys" "grp:caps_toggle" &
wmname LG3D &
xsetroot -cursor_name 'left_ptr' &
xrdb -merge ~/.Xdefaults &
~/.xmonad/bin/tray &
~/.fehbg &

