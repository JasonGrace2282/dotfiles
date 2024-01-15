#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

WM="i3-wm awesome-git"
extras="fastfetch osmo nm-connection-editor acpi python customtkinter nvim"
browser="firefox firefox-tridactyl firefox-tridactyl-native"
pkglist="${WM} polybar zsh picom pcmanfm maim dunst kitty rofi ${extras} ${browser}"

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
