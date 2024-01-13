# Configs
This is a git backup of most of my files in `~/.config`. Among them you can find:
* Awesome WM config
* i3 and i3status
* Polybar
* (admittedly unmodified) neofetch/fastfetch
* `.zshrc`
* kitty
* picom
* rofi
* My custom simple-settings-gui config
* PCmanFM config
* Some gtk configs

## Installation
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
* fastfetch (faster neofetch)
This will depend on os, but for archlinux most of these packages are available with `pacman`.

You can then execute the following commands:
```bash
mv ~/.config ~/.config.backup
git clone https://github.com/JasonGrace2282/configs.git ~/.config
```
You will then need to manually change all the `/home/jasongrace2282`'s to the absolute path of the user you are using it for.

If you are on archlinux, there is a handy script to install most dependencies for you, just run
```bash
bash ~/.config/setup.sh
```
