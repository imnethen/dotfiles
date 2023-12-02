from libqtile import bar
from libqtile.config import Screen
from libqtile.lazy import lazy
# from qtile_extras.widget.decorations import RectDecoration
from qtile_extras import widget


# deco = {
#     "decorations": [RectDecoration(
#         colour="#202020",
#         radius=15,
#         filled=True,
#     )],
# }


# TODO: clock thingy, fix whatever mess i made with the colors, add cool qtile_extras deco
# %d.%m %a %I:%M %p


def front_sep(fg, bg):
    return widget.TextBox(
        fmt="◣",
        fontsize=70,
        padding=-3,
        foreground=fg,
        background=bg,
    )


def back_sep(fg, bg):
    return widget.TextBox(
        fmt="◢",
        fontsize=70,
        padding=-3,
        foreground=fg,
        background=bg,
    )


def groupbox(theme):
    return widget.GroupBox(
        highlight_method="text",
        this_current_screen_border=theme.colors["groupbox_this_current_screen_border"],

        fontsize=30,

        hide_unused=True,

        background=theme.colors["bar_colors"][2],
    )


def volume(theme):
    return widget.PulseVolume(
        fmt="Volume: {}",
        fontsize=16,
        background=theme.colors["bar_colors"][3]
    )


def tasklist(theme):
    return widget.TaskList(
        borderwidth=0,
        highlight_method="block",
        border=theme.colors["bar_colors"][4],
        background=theme.colors["bar_colors"][4]
    )


def tray(theme):
    return widget.Systray(
        background=theme.colors["bar_colors"][3],
        icon_size=25,
    )


def clock(theme):
    return widget.Clock(
        format="%d.%m %a %I:%M %p",
        # format=clock_format,
        background=theme.colors["bar_colors"][2],
        mouse_callbacks={
            "Button1": lazy.spawn("gsimplecal"),
        },
    )


def exit(theme):
    return widget.QuickExit(
        fontsize=30,
        default_text="",
        countdown_format="[{}]",
        background=theme.colors["bar_colors"][2],
    )


def get_screens(theme):
    return [
        Screen(
            wallpaper=theme.wallpaper,
            wallpaper_mode="fill",

            bottom=bar.Bar(
                [
                    front_sep(theme.colors["bar_colors"][1], theme.colors["bar_colors"][2]),
                    groupbox(theme),
                    front_sep(theme.colors["bar_colors"][2], theme.colors["bar_colors"][3]),
                    volume(theme),
                    front_sep(theme.colors["bar_colors"][3], theme.colors["bar_colors"][4]),
                    tasklist(theme),
                    widget.Spacer(background=theme.colors["bar_colors"][4]),

                    widget.Prompt(background=theme.colors["bar_colors"][4]),
                    back_sep(theme.colors["bar_colors"][3], theme.colors["bar_colors"][4]),
                    tray(theme),
                    back_sep(theme.colors["bar_colors"][2], theme.colors["bar_colors"][3]),
                    clock(theme),
                    widget.Spacer(
                        length=10,
                        background=theme.colors["bar_colors"][2],
                    ),
                    exit(theme),
                    widget.Spacer(
                        length=10,
                        background=theme.colors["bar_colors"][2],
                    ),
                    back_sep(theme.colors["bar_colors"][1], theme.colors["bar_colors"][2]),
                ],
                30,

                margin=[0, 400, 5, 400],
                border_width=2,
                border_color=theme.colors["bar_border_color"],
                background=theme.colors["bar_background"],
            ),
        ),
    ]
