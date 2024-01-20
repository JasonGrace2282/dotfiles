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

read -p "Would you like to install some extra utilities?[Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    pkglist="${pkglist} fastfetch osmo nm-connection-editor acpi python customtkinter neovim zsh zsh-theme-powerlevel10k-git bat"
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

echo "Installing packages (this may take a while!)"
${AUR_HELPER} -S ${pkglist}

echo "You're almost done! Just install the Fredoka font from google: https://fonts.google.com/specimen/Fredoka"
echo "Download the font family and then use the command: unzip <installed zip file> && mv Fredoka ~/.local/share/fonts/Fredoka"
