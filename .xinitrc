#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xcompmgr -cC -r5 -o0.4 -l0 -t0 &
xbindkeys &

DEFAULT_SESSION=awesome
case $1 in
	awesome) exec awesome ;;
	*) exec $DEFAULT_SESSION ;;
esac
