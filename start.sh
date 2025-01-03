#!/bin/bash

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
#export XDG_RUNTIME_DIR=/tmp/$USER/.xdg
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export LIBGL_DRI3_ENABLE=1
#export GDK_BACKEND=wayland
export XKB_DEFAULT_RULES=evdev
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export BEMENU_BACKEND=wayland
export WLR_DRM_NO_ATOMIC=1
export XCURSOR_THEME=whiteglass

[ -d $XDG_RUNTIME_DIR ] || mkdir -m 700 $XDG_RUNTIME_DIR

doas kldload i915kms
mkdir -p ~/.cache

chown $USER:$USER "$XDG_RUNTIME_DIR" 2>/dev/null

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session Hyprland
