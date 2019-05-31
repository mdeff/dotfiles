# Shell configuration file read upon login to set environment variables.
# It is read upon login by multiple shells.
# https://en.wikipedia.org/wiki/Unix_shell#Configuration_files

# System configuration (made by packages) is in /etc/profile.d/

###############################################################################
# XDG base directory structure
###############################################################################

# Default.
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

# Binaries, see "systemd-path user-binaries" and "man file-hierarchy".
export PATH="$HOME/.local/bin:$PATH"

# X11
# export XAUTHORITY="$XDG_RUNTIME_DIR"/X11/xauthority
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# xinitrc: userresources="$XDG_CONFIG_HOME"/X11/xresources

# Bash.
export HISTFILE="$XDG_DATA_HOME"/bash/history
#set +o history  # Disable history.

# Vim. Now using neovim exclusively.
# export VIMINIT='let $VIMRC="$XDG_CONFIG_HOME/nvim/init.vim" | source $VIMRC'

###############################################################################
# SSH agent
###############################################################################

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

###############################################################################
# Password manager: pass
###############################################################################

export PASSWORD_STORE_DIR="/data/divers/passwords"

###############################################################################
# Text editor: neovim
###############################################################################

export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

###############################################################################
# Pager: less
###############################################################################

export PAGER="/usr/bin/less"

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

###############################################################################
# Java
###############################################################################

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dsun.java2d.opengl=true'

# Anti-aliased fonts for Java applications. Same results with gasp, lcd, on.
# https://wiki.archlinux.org/index.php/Java_Runtime_Environment_fonts
# awt.useSystemAAFontSettings=gasp
# awt.useSystemAAFontSettings=lcd
# awt.useSystemAAFontSettings=on

# Made no difference:
# swing.aatext=true
# export JAVA_FONTS=/usr/share/fonts/TTF

# Better 2D performance.
# https://wiki.archlinux.org/index.php/java
# sun.java2d.opengl=true

# Options to force GTK look&fell (may break some applications) (the default Java cross-platform look&feel is metal):
# swing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel
# swing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel

###############################################################################
# Matlab
###############################################################################

# Use the system Java instead of matlab's own Java.
export MATLAB_JAVA="/usr/lib/jvm/default/jre"

# For a specific version:
# export MATLAB_JAVA="/usr/lib/jvm/java-8-openjdk/jre"

###############################################################################
# Jupyter lab
###############################################################################

# Build jlab in a user directory to be able to install extensions.
export JUPYTERLAB_DIR="$XDG_DATA_HOME"/jupyter/lab

###############################################################################
# Mozilla Firefox
###############################################################################

# Scroll by touching the screen.
export MOZ_USE_XINPUT2=1

# Use wayland by default (without forcing all GTK apps to switch).
export MOZ_ENABLE_WAYLAND=1

###############################################################################
# Sway
###############################################################################

# https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland

# Force GTK3 applications to use Wayland, not XWayland.
# Enable per app, not globally:
# * Firefox 64 doesn't find screen as of 2019-01-16. Resolved in Firefox 67 as of 2019-05-31.
# * Thunderbird and LibreOffice doesn't find screen as of 2019-05-31.
#export GDK_BACKEND=wayland
#export CLUTTER_BACKEND=wayland

# Force Qt applications to use Wayland, not XWayland.
#export QT_QPA_PLATFORM=wayland-egl  # wayland, wayland-egl, wayland-???
#export QT_WAYLAND_FORCE_DPI=physical
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Some Java AWT applications don't display properly under Xwayland without the following.
# That is the case of Gephi.
# https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland
export _JAVA_AWT_WM_NONREPARENTING=1
