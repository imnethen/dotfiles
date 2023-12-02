class theme:
    colors: dict
    wallpaper: str

    def __init__(self, colors, wallpaper):
        self.colors = colors
        self.wallpaper = wallpaper


# layout_border_focus, layout_border_normal, groupbox_highlight_color
# groupbox_this_current_screen_border, bar_border_color, bar_background


themes = {
    "dracula": theme(
        colors={
            "layout_border_focus": "#ff79c6",
            "layout_border_normal": "#1d2330",
            "groupbox_highlight_color": "#44475a",
            "groupbox_this_current_screen_border": "ff79c6",
            "bar_border_color": "#ff79c6",
            "bar_background": "#282a36",
        },
        wallpaper="~/Pictures/fedora.png",
    ),

    "gruvbox": theme(
        colors={
            "layout_border_focus": "#d79921",
            "layout_border_normal": "#282828",
            # "groupbox_highlight_color": "#44475a",
            "groupbox_this_current_screen_border": "#202020",
            "bar_border_color": "#a89984",
            "bar_background": "#202020",
            "bar_colors": [
                "#ebdbb2",
                "#a89984",
                "#7c6f64",
                "#504945",
                "#3c3836",
            ],
        },
        wallpaper="~/Pictures/wallpapers/gruvbox.png",
    )
}


def get_theme(theme):
    return themes[theme]
