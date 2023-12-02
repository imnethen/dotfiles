import os
import subprocess
from libqtile import layout, hook
from libqtile.config import Click, Drag, Match, Key
from libqtile.lazy import lazy

from themes import get_theme
from keys import get_keys
from groups import get_groups, get_scratch_pad
from screens import get_screens

theme = get_theme("gruvbox")

keys = get_keys(mod="mod4")
groups = get_groups()
scratchpad = get_scratch_pad()

mod = "mod4"

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
            ),
        ]
    )

groups.append(scratchpad),

keys.extend([
    Key([mod], "r", lazy.group["scratchpad"].dropdown_toggle("ranger")),
    Key([mod], "g", lazy.group["scratchpad"].dropdown_toggle("recorder")),
    Key([mod], "c", lazy.group["scratchpad"].dropdown_toggle("calc")),
    Key([mod], "h", lazy.group["scratchpad"].dropdown_toggle("htop")),
])

layout_theme = {
    "border_width": 2,
    "margin": 10,
    "border_focus": theme.colors["layout_border_focus"],
    "border_normal": theme.colors["layout_border_normal"],
}

layouts = [
    layout.Columns(
        **layout_theme,
        border_on_single=True,
    ),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


widget_defaults = dict(
    font="FiraCode Nerd Font Mono SemiBold",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = get_screens(theme)

# TODO: maybe figure out how to not hardcode mod4 ?
# Drag floating layouts.
mouse = [
    Drag(["mod4"], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag(["mod4"], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click(["mod4"], "Button2", lazy.window.bring_to_front()),
]


# Autostart
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
