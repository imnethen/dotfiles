#!/bin/sh
setxkbmap -option caps:escape &
clipmenud &
fcitx5 -dr &

firefox &
flatpak run com.discordapp.Discord &
flatpak run org.telegram.desktop &
flatpak run md.obsidian.Obsidian &
