#!/bin/bash

# if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root" 1>&2
#    exit 1
# fi

pkglist="zsh picom pcmanfm maim dunst kitty"
I3="i3-wm polybar rofi"
awesome="awesome-git rofi"
hypr="hyprland waybar rofi-lbonn-wayland wl-clipboard wl-clipboard-x11"
# check which WMs to install
read -p "Which window manager do you want to install?[i3/awesome/hypr/all] " yn
case $yn in
    i3 ) pkglist="${I3} ${pkglist}";;
    awesome ) pkglist="${awesome} ${pkglist}";;
    hypr ) pkglist="${hypr} ${pkglist}";;
    all ) pkglist="${I3} ${awesome} ${hypr} ${pkglist}";;
    *) echo "Sorry, did not understand your response";exit 1;;
esac

read -p "Would you like to install some extra utilities?[Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    pkglist="${pkglist} fastfetch osmo nm-connection-editor acpi python customtkinter nvim"
fi

read -p "Would you like to install vi-like keybinds for firefox?[y/N] " -n 1 -r
echo  
if [[ $REPLY =~ ^[Yy]$ ]]
then
    pkglist="${pkglist} firefox firefox-tridactyl firefox-tridactyl-native"
fi

# handle AUR helpers
if [[ ${AUR_HELPER} != "" ]] then
    echo "Using AUR helper ${AUR_HELPER}"
elif [[  "$(command -v paru)" == "/sbin/paru" ]] then
    AUR_HELPER=paru
elif [[ "$(command -v yay)" == "/sbin/yay" ]] then
    AUR_HELPER=yay
fi

if [[ ${AUR_HELPER} != "" ]] then
    echo "Installing ${pkglist}"
    ${AUR_HELPER} -S ${pkglist}
else
    echo "Must install an AUR helper such as paru or yay, or set environment variable AUR_HELPER to another script allowing AUR_HELPER -S"
fi
