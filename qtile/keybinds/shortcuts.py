from libqtile.lazy import lazy
from libqtile.config import Key
from constants import mod, terminal
import os, subprocess

def take_screenshot(qtile):
    os.system("maim -s | xclip -selection clipboard -t image/png")

def save_screenshot(qtile):
    # os.system("python ~/.config/scripts/screenshot.py")
    # current not working?
    pass

shortcuts = [
    Key([mod], "Return", lazy.spawn(terminal), lazy.layout.left(), desc="Launch terminal"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod, "shift"], "r",
        lazy.spawn("dunstify \"Reloading config\" -t 1000"),
        lazy.reload_config(),
        desc="Reload the config"
    ),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),
    Key([mod], "q", lazy.spawn("firefox"), desc="Launch Browser (Firefox)"),
    Key([mod, "shift"], "d", lazy.spawn("discord"), desc="Launch Discord"),
    Key([mod], "p", lazy.spawn('dunstctl close-all'), desc="Close all notifications"),

    Key([mod], "v",
        lazy.spawn("rofi -modi \"clipboard:greenclip print\" -show clipboard"),
        desc="Open clipboard history"
    ),

    Key([mod, "shift"], "s", lazy.function(take_screenshot), desc="take screenshot"),
    Key([mod], "c", lazy.function(save_screenshot), desc="save screenshot to file"),
]
