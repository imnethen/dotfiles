from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Match, Screen, Key
from libqtile.lazy import lazy

from themes import get_theme
from keys import get_keys
from groups import get_groups

theme = get_theme("gruvbox")

keys = get_keys(mod="mod4")
groups = get_groups()

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

screens = [
    Screen(
        wallpaper=theme.wallpaper,
        wallpaper_mode="fill",

        # ◣◢◤◥
        bottom=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color=theme.colors["groupbox_highlight_color"],
                    this_current_screen_border=theme.colors["groupbox_this_current_screen_border"],

                    fontsize=30,

                    hide_unused=True,

                    background="#333333",
                    # background="#ffffff",
                ),
                widget.TextBox(
                    fmt="◣",
                    fontsize=70,
                    padding=-3,
                    # background=theme.colors["bar_background"],
                    foreground="#333333",
                    # foreground="#ffffff",
                ),
                # widget.Sep(
                #     background="#ffffff",
                #     foreground="#ffffff",
                # ),
                widget.TaskList(
                    borderwidth=0,
                    highlight_method="block",
                    border=theme.colors["groupbox_highlight_color"],
                ),
                widget.Prompt(),
                # widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                # widget.KeyboardLayout(
                #     configured_keyboards=["us workman", "mozc"],
                #     max_chars=0,
                # ),
                widget.Sep(),
                widget.Clock(format="%d.%m %a %I:%M %p"),
                widget.Sep(),
                widget.QuickExit(
                    fontsize=30,
                    default_text="",
                    countdown_format="[{}]",
                ),
                widget.PulseVolume(),
            ],
            30,

            border_width=[2, 0, 0, 0],  # Draw top and bottom borders
            margin=[0, 10, 6, 10],
            border_color=theme.colors["bar_border_color"],
            background=theme.colors["bar_background"],
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# TODO: maybe figure out how to not hardcode mod4 ?
# Drag floating layouts.
mouse = [
    Drag(["mod4"], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag(["mod4"], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click(["mod4"], "Button2", lazy.window.bring_to_front()),
]

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
