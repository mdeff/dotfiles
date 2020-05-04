#!/bin/sh

# Read by startx.
# Wayland equivalent: .local/bin/startw

# merge in defaults and keymaps
xrdb -load ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start X11 window manager.
exec i3
