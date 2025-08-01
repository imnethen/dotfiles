#!/bin/sh

# Key are specified by their XKB keysym name. See /usr/include/xkbcommon/xkbcommon-keysyms.h for the complete list.

# Super+Shift+Return to start an instance of kitty
riverctl map normal Super Q spawn kitty

# Super + S for wofi the Launcher
riverctl map normal Super S spawn "wofi --show drun --style ~/.config/wofi/style.css"

# Super+W to close the focused view
riverctl map normal Super W close

# Super+Shift+E to exit river
riverctl map normal Super+Shift E exit

# Super+J and Super+K to focus the next/previous view in the layout stack
riverctl map normal Super J focus-view next
riverctl map normal Super H focus-view next
riverctl map normal Super K focus-view previous
riverctl map normal Super L focus-view previous

riverctl map normal Super Space focus-view next
riverctl map normal Super+Shift Space focus-view previous

# Super+Shift+J and Super+Shift+K to swap the focused view with the next/previous
# view in the layout stack
riverctl map normal Super+Shift J swap next
riverctl map normal Super+Shift L swap next
riverctl map normal Super+Shift K swap previous
riverctl map normal Super+Shift H swap previous

# Super+Period and Super+Comma to focus the next/previous output
# riverctl map normal Super Period focus-output next
# riverctl map normal Super Comma focus-output previous

# Super+Shift+{Period,Comma} to send the focused view to the next/previous output
# riverctl map normal Super+Shift Period send-to-output next
# riverctl map normal Super+Shift Comma send-to-output previous

# Super+Return to bump the focused view to the top of the layout stack
riverctl map normal Super Return zoom

# Super+H and Super+L to decrease/increase the main ratio of rivertile(1)
riverctl map normal Super+Control H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super+Control L send-layout-cmd rivertile "main-ratio +0.05"

# Super+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)
riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"

# Super+Alt+{H,J,K,L} to move views
# riverctl map normal Super+Alt H move left 100
# riverctl map normal Super+Alt J move down 100
# riverctl map normal Super+Alt K move up 100
# riverctl map normal Super+Alt L move right 100

# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
# riverctl map normal Super+Alt+Control H snap left
# riverctl map normal Super+Alt+Control J snap down
# riverctl map normal Super+Alt+Control K snap up
# riverctl map normal Super+Alt+Control L snap right

# Super+Alt+Shift+{H,J,K,L} to resize views
# riverctl map normal Super+Alt+Shift H resize horizontal -100
# riverctl map normal Super+Alt+Shift J resize vertical 100
# riverctl map normal Super+Alt+Shift K resize vertical -100
# riverctl map normal Super+Alt+Shift L resize horizontal 100

# Super + Left Mouse Button to move views
riverctl map-pointer normal Super BTN_LEFT move-view

# Super + Right Mouse Button to resize views
riverctl map-pointer normal Super BTN_RIGHT resize-view

# Super + Middle Mouse Button to toggle float
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

# creates keybindings for workspace for key $1 with tags $2
register_workspace () {
    riverctl map normal Super $1 set-focused-tags $2
    riverctl map normal Super+Shift $1 set-view-tags $2
    riverctl map normal Super+Control $1 toggle-focused-tags $2
    riverctl map normal Super+Shift+Control $1 toggle-view-tags $2
}

# number of tags used for specific stuff like firefox, discord, etc
specialTags=0

# terminal
register_workspace A $((1 << $specialTags))
specialTags=$((specialTags+1))
# firefox
register_workspace X $((1 << $specialTags))
specialTags=$((specialTags+1))
# discord
register_workspace D $((1 << $specialTags))
specialTags=$((specialTags+1))
# telegram
register_workspace M $((1 << $specialTags))
specialTags=$((specialTags+1))
# zoom
register_workspace Z $((1 << $specialTags))
specialTags=$((specialTags+1))

for i in $(seq 1 9)
do
    tags=$((1 << (((i + specialTags)) - 1)))

    register_workspace $i $tags
done

# Super+0 to focus all tags
# Super+Shift+0 to tag focused view with all tags
all_tags=$(((1 << 32) - 1))
riverctl map normal Super 0 set-focused-tags $all_tags
riverctl map normal Super+Shift 0 set-view-tags $all_tags

# Super+Space to toggle float
riverctl map normal Super T toggle-float

# Super+F to toggle fullscreen
riverctl map normal Super F toggle-fullscreen

# Super+{Up,Right,Down,Left} to change layout orientation
riverctl map normal Super Up    send-layout-cmd rivertile "main-location top"
riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
riverctl map normal Super Down  send-layout-cmd rivertile "main-location bottom"
riverctl map normal Super Left  send-layout-cmd rivertile "main-location left"


# screenshots
riverctl map normal Super Print spawn "grimshot copy area"
riverctl map normal Super+Control Print spawn "grimshot save area"
riverctl map normal Super+Shift Print spawn "grimshot copy screen"
riverctl map normal Super+Shift+Control Print spawn "grimshot save screen"

riverctl map normal Super Delete spawn "grimshot copy area"
riverctl map normal Super+Control Delete spawn "grimshot save area"
riverctl map normal Super+Shift Delete spawn "grimshot copy screen"
riverctl map normal Super+Shift+Control Delete spawn "grimshot save screen"


# mpd
riverctl map normal Super slash spawn "mpc toggle"

# tts
riverctl map normal Super R spawn "/home/nethen/.local/bin/wofispeak.sh"


# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# Super+F11 to enter passthrough mode
riverctl map normal Super F11 enter-mode passthrough

# Super+F11 to return to normal mode
riverctl map passthrough Super F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
# for mode in normal locked
# do
#     # Eject the optical drive (well if you still have one that is)
#     riverctl map $mode None XF86Eject spawn 'eject -T'

#     # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
#     riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
#     riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
#     riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'

#     # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
#     riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
#     riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
#     riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
#     riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

#     # Control screen backlight brightness with brightnessctl (https://github.com/Hummer12007/brightnessctl)
#     riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
#     riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
# done
