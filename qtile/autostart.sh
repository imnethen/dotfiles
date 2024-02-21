#!/bin/sh
setxkbmap -option caps:escape &
clipmenud &
fcitx5 -dr &
dunst &
picom --config ~/.config/picom/picom.conf &

firefox &
flatpak run com.discordapp.Discord &
flatpak run org.telegram.desktop &
flatpak run md.obsidian.Obsidian &
