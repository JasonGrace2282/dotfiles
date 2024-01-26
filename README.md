# JasonGrace2282's Dotfiles
![Screenshot of my setup](https://github.com/JasonGrace2282/dotfiles/assets/110117391/a97016ac-0f66-4571-a282-648f85bf26a7)


This is a git backup of most of my files in `~/.config`. Among them you can find:
* i3
* qtile (work in progress)
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
Execute the following commands to backup your current configuration and install this repository.
```bash
mv ~/.config ~/.config.backup
git clone https://github.com/JasonGrace2282/dotfiles.git ~/.config
```
You will then need to manually change the `set $HOME /home/jasongrace2282` to `set $HOME /home/<your username>`. If you are unsure of your username, try
 running `whoami` in a terminal.

If you are on archlinux, there is a handy script to install most dependencies for you, just run
```bash
bash ~/.config/setup.sh
```

To get an (almost) fully functioning system, accept the defaults for each option.
