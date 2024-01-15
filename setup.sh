#!/bin/bash

# if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root" 1>&2
#    exit 1
# fi

WMs="i3-wm awesome-git"
pkglist="polybar zsh picom pcmanfm maim dunst kitty rofi"

read -p "Do you want to install i3, awesome, or both?[i3/awesome/both] " yn
case $yn in
    i3 ) pkglist="i3-wm ${pkglist}";;
    awesome ) pkglist="awesome-git ${pkglist}";;
    both ) pkglist="i3-wm awesome-git ${pkglist}";;
esac

read -p "Would you like to install vi-like keybinds for firefox?[y/N] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $REPLY
    pkglist="${pkglist} firefox firefox-tridactyl firefox-tridactyl-native"
fi

read -p "Would you like to install some extra dependencies?[Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    pkglist="${pkglist} fastfetch osmo nm-connection-editor acpi python customtkinter nvim"
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
