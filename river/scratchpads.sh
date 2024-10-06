#!/bin/sh

# $1 is keymap
# $2 is app id
# $3 is tag
# $4 is position (2 values in a string)
# $5 is dimensions (2 values in a string)
register_scratchpad () {
    # window rules
    riverctl rule-add -app-id $2 float
    riverctl rule-add -app-id $2 position $4
    riverctl rule-add -app-id $2 dimensions $5
    riverctl rule-add -app-id $2 tags $3

    # keymap
    riverctl map normal Super $1 spawn "python3 /home/nethen/.config/river/ensure_scratchpad_open.py $2 && riverctl toggle-focused-tags $3"
}

# Same as specialTags from keymaps.sh but for scratchpads
scratchpadTags=0

# qalc
register_scratchpad C qalc $((1 << (30 - $scratchpadTags))) "52 288" "1280 864"
scratchpadTags=$((scratchpadTags+1))

# pulsemixer
register_scratchpad P pulsemixer $((1 << (30 - $scratchpadTags))) "1524 468" "1024 504"
scratchpadTags=$((scratchpadTags+1))

# ncmpcpp
register_scratchpad N ncmpcpp $((1 << (30 - $scratchpadTags))) "640 12" "1280 720"
scratchpadTags=$((scratchpadTags+1))
