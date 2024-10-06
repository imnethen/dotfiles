#!/bin/sh

# TODO: better wallpapers
swaybg -i ~/Pictures/wallpapers/everforest/cats.jpg &
waybar &
dunst &
mpd &

firefox &
# discord --enable-features=UseOzonePlatform --ozone-platform=wayland &
flatpak run dev.vencord.Vesktop &
telegram-desktop &
obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland
