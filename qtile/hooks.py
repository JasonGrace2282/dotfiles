from libqtile import hook
import os, subprocess

@hook.subscribe.client_new
def move_to_workspace(client):
    if client.name.lower() == "discord":
        client.togroup("2")

@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser("~/.config/qtile/startup.sh")
    subprocess.call(autostart)


