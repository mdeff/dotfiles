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

# Color highlighting.
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
# Color highlight man pages
###############################################################################

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

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
# jlab 3 now recommends to install extensions as python packages, without requiring a rebuild
# export JUPYTERLAB_DIR="$XDG_DATA_HOME"/jupyter/lab

###############################################################################
# Python pip
###############################################################################

# Don't install to ~/.local/ without explicit --user at the CLI.
export PIP_USER=false

###############################################################################
# Python pyenv
###############################################################################

# export PATH="$HOME/.pyenv/shims:$PATH"
# activate python version with `export PYENV_VERSION=3.6.0`
# alternative in .config/fish/config.fish

###############################################################################
# Mozilla Firefox
###############################################################################

# Scroll and zoom by touching the screen.
# 2020-04-05: needed on X11, not wayland.
export MOZ_USE_XINPUT2=1

###############################################################################
# Sway / Wayland
###############################################################################

# See ~/.local/bin/startw. We don't want them on tty or i3.

###############################################################################
# Hardware video acceleration
###############################################################################

# Bypass GStreamer's whitelist of VA-API drivers, for GST to use intel-media-driver.
# https://wiki.archlinux.org/index.php/Hardware_video_acceleration#Application_support
# https://wiki.archlinux.org/index.php/GStreamer#Hardware_video_acceleration
export GST_VAAPI_ALL_DRIVERS=1

###############################################################################
# Linear algebra (BLAS & LAPACK)
###############################################################################

# Providers: netlib, OpenBLAS, MKL, BLIS
# Users: NumPy, SciPy, Julia, R, octave, etc.

# Limit the number of threads to the number of physical cores.
# May or may not boost performance.
# OpenBLAS: https://github.com/xianyi/OpenBLAS/blob/f059e614eb612cb2741d682ed5e7f62ddfdada76/Makefile.rule#L82
# MKL: https://github.com/intel/mkl-dnn/issues/619#issuecomment-570361798
# If multiple processes are spawned, it could be better to allow no more than 1 thread per process.
# https://github.com/numpy/numpy/issues/11826
#export OMP_NUM_THREADS=2

# MKL Fortran interface for scipy: GNU Fortran compiler, 64bits longs and pointers (integers are 32 bits).
# https://github.com/scipy/scipy/issues/11812
# https://github.com/scipy/scipy/pull/10591
export MKL_INTERFACE_LAYER=LP64,GNU
#export MKL_THREADING_LAYER  # OpenMP?
