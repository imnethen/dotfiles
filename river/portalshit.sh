#/bin/sh

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
systemctl --user stop pipewire xdg-desktop-portal xdg-desktop-portal-wlr pipewire.socket wireplumber
systemctl --user start pipewire xdg-desktop-portal xdg-desktop-portal-wlr
