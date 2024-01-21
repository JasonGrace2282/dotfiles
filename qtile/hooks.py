from libqtile import hook
import os, subprocess


@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser("~/.config/qtile/startup.sh")
    subprocess.call(autostart)


