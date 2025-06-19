#!/bin/sh

# Cursor config
riverctl focus-follows-cursor always
riverctl input pointer-5426-120-Razer_Razer_Viper accel-profile flat
riverctl input pointer-5426-120-Razer_Razer_Viper pointer-accel 0.5
riverctl input pointer-5426-120-Razer_Razer_Viper scroll-factor 2

# Keyboard config
riverctl set-repeat 25 600
riverctl keyboard-layout -variant workman, -options caps:escape,grp:alts_toggle,compose:rctrl us,ru

# Set the default layout generator to be rivertile and start it.
# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout rivertile
rivertile -main-location right -view-padding 6 -outer-padding 6 &

# Set background and border color
riverctl background-color 0x002b36
# riverctl border-color-focused 0xd3c6aa
riverctl border-color-focused 0xa7c080
riverctl border-color-unfocused 0x868d80

# TODO
# border-stuff
# uhh
# i already did border stuff but this is still here idk
