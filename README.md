# JasonGrace2282's Dotfiles
### i3
![Screenshot of my i3 setup](https://github.com/JasonGrace2282/dotfiles/assets/110117391/a97016ac-0f66-4571-a282-648f85bf26a7)

### Hyprland
![Screenshot of my Hyprland Setup](https://github.com/JasonGrace2282/dotfiles/assets/110117391/e03b15b5-685a-44dd-a9b1-191b76802b5d)



This is a git backup of most of my files in `~/.config`. Among them you can find:
* i3
* hyprland (work in progress)
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
When using i3, you will then need to manually change the `set $HOME /home/jasongrace2282` to `set $HOME /home/<your username>`. If you are unsure of your username, try
 running `whoami` in a terminal.

To use the neovim configuration you must also run this command:
```bash
touch ~/.config/nvim/lua/config/projects.lua && echo "return {}" > ~/.config/nvim/lua/config/projects.lua
```
