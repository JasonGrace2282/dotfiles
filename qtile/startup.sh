#!/bin/bash


feh --bg-scale ~/.config/background/archbg.png &
picom -b
nm-applet &
systemctl --user enable --now greenclip
