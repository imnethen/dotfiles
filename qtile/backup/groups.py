from libqtile.config import Group, Key
from libqtile.lazy import lazy

groups = [
    Group(
        name="a",
        label="",
    ),
    Group(
        name="x",
        label="",
    ),
    Group(
        name="d",
        label="",
    ),
    Group(
        name="m",
        label="",
    ),
    Group(
        name="o",
        label="",
    ),
    Group(
        name="z",
        label="Z",
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
