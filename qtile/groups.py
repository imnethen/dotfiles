from libqtile.config import Group, ScratchPad, DropDown, Match

groups = [
    Group(
        name="a",
        label="",
    ),
    Group(
        name="x",
        label="",
        matches=[Match(wm_class=["firefox"])],
    ),
    Group(
        name="d",
        label="",
        matches=[Match(wm_class=["discord"])],
    ),
    Group(
        name="m",
        label="",
        matches=[Match(wm_class=["telegram-desktop"])],
    ),
    Group(
        name="o",
        label="",
        matches=[Match(wm_class=["obsidian"])],
    ),
    Group(
        name="z",
        label="Z",
        matches=[Match(wm_class=["zoom"])],
    ),
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
]


def get_groups():
    return groups


def get_scratch_pad():
    return ScratchPad(
        "scratchpad",
        [
            DropDown("ranger", "kitty --class=ranger -T ranger -e ranger", width=.8, height=.8, x=.1, y=.1),
            DropDown("recorder", "flatpak run com.dec05eba.gpu_screen_recorder", match=Match(wm_class=["gpu-screen-recorder-gtk"]), width=.8, height=.8, x=.1, y=.1),
            DropDown("calc", "kitty --class=qalc -T calculator -e qalc", width=.4, height=.6, x=.1, y=.1),
            DropDown("htop", "kitty --class=htop -T htop -e htop", width=.8, height=.8, x=.1, y=.1),
        ])
