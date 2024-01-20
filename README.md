# JasonGrace2282's Dotfiles
![Screenshot of my setup](https://github.com/JasonGrace2282/dotfiles/assets/110117391/a97016ac-0f66-4571-a282-648f85bf26a7)


This is a git backup of most of my files in `~/.config`. Among them you can find:
* Awesome WM config (basic, for screenshots see [this](https://github.com/JasonGrace2282/awesome-wm))
* Hyprland config
* i3
* Polybar
* fastfetch
* `.zshrc`
* kitty
* picom
* rofi
* [simple-settings-gui](https://github.com/JasonGrace2282/simple_settings_gui) config
* PCmanFM config
* Some gtk configs

## Installation
Note: `setup.sh` has the most up-to-date dependency list. If you do not want to install everything, feel free to remove some packages from it.

You will need to install the following packages:
* i3-wm/awesome
* polybar/waybar
* zsh
* picom
* pcmanfm
* maim (screenshots)
* dunst (notifications)
* kitty
* rofi
* fastfetch and/or neofetch
* python and customtkinter python library
* Some small applications like osmo
This will depend on os, but for archlinux most of these packages are available with `pacman` or in the AUR.

You can then execute the following commands:
```bash
mv ~/.config ~/.config.backup
git clone https://github.com/JasonGrace2282/dotfiles.git ~/.config
```
You will then need to manually change all the `/home/jasongrace2282`'s to the absolute path of the user you are using it for.

If you are on archlinux, there is a handy script to install most dependencies for you, just run
```bash
bash ~/.config/setup.sh
```
