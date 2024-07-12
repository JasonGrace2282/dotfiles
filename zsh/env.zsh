export KITTY_SHELL_INTEGRATION="enabled"
export PATH="$HOME/.ghcup/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export AUTOENV_FILE_LEAVE=".autoenv.zsh"
export BAT_THEME="TwoDark"
export CHROOT="$HOME/chroot"
export ZSH_AUTOSUGGEST_STRATEGY=history
export EDITOR='nvim'

export SCREENSHOTS="~/Pictures/Screenshots"
export DIFFPROG=nvim

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
  source $ZSHCONFIG/wayland.zsh
else
  export MOZ_ENABLE_WAYLAND=0
fi

