# JasonGrace2282's Dotfiles
![image](https://github.com/JasonGrace2282/dotfiles/assets/110117391/9ad599f3-cd5a-45d6-aca6-690ab63eff1a)

This is a git backup of most of my files in `~/.config`. Among them you can find:
* Awesome WM config
* i3 and i3status
* Polybar
* fastfetch
* `.zshrc`
* kitty
* picom
* rofi
* My custom simple-settings-gui config
* PCmanFM config
* Some gtk configs

## Installation
Note: `setup.sh` has the most up-to-date dependency list. If you do not want to install everything, feel free to remove some packages from it.

You will need to install the following packages:
* i3-wm/awesome
* polybar
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
