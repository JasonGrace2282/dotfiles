#!/bin/bash

# handle AUR helpers
if [[ ${AUR_HELPER} != "" ]] then
    echo "Using AUR helper ${AUR_HELPER}"
elif [[  "$(command -v paru)" == *"/paru" ]] then
    AUR_HELPER=paru
elif [[ "$(command -v yay)" == *"/yay" ]] then
    AUR_HELPER=yay
else
    echo "Must install an AUR helper such as paru or yay, or set environment variable AUR_HELPER to another script allowing installation with \$AUR_HELPER -S"
fi

pkglist="zsh pcmanfm dunst kitty"
I3="i3-wm polybar rofi xss-lock i3lock-color feh picom-ftlabs-git maim python-i3ipc"
pkglist="${I3} ${pkglist}"

echo "Would you like to install some extra utilities?"
read -p "Note that without these utilities, some functions may not work[Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    pkglist="${pkglist} fastfetch osmo nm-connection-editor acpi python customtkinter neovim zsh zsh-theme-powerlevel10k-git bat spotify"
fi

read -p "Would you like to install some fonts?[Y/n]" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
  pkglist="${pkglist} ttf-google-fonts-git ttf-font-awesome $(pacman -Ssq noto-font)"
fi

read -p "Would you like to install vi-like keybinds for firefox?[y/N] " -n 1 -r
echo  
if [[ $REPLY =~ ^[Yy]$ ]]
then
    pkglist="${pkglist} firefox firefox-tridactyl firefox-tridactyl-native-bin"
fi

if [[ "$1" != "--no-upgrade" ]]
then
    echo "Upgrading archlinux!"
    flag="-Syu"
else
    echo "Warning: will not upgrade Arch with install"
    flag="-S"
fi

echo "Installing packages (this may take a while!)"
${AUR_HELPER} ${flag} ${pkglist} --needed

# check exit code of installation
if [[ "$?" != "0" ]]
then
    echo "Uh oh, an error occured. Please try again."
    exit 1
fi

echo "You're almost done! Just install the Fredoka font from google: https://fonts.google.com/specimen/Fredoka"
echo "Download the font family and then use the command: unzip <installed zip file> && mv Fredoka ~/.local/share/fonts/Fredoka"
