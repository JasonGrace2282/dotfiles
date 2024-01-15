# fastfetch

# ssh
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function battery () # in case have to check from terminal
{
  echo "Battery: "
  echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
  echo "$(cat /sys/class/power_supply/BAT0/status)"
}

function brightness ()
{
  if [ -z $1 ]; then
      echo "Usage: brighntess BRIGHTNESS"
      echo "BRIGHTNESS is a float (0.0-1.0)"
  else
      xrandr --listmonitors | grep "^ " | cut -f 6 -d' ' | \
      xargs --replace=0 xrandr --output 0 --brightness $1
  fi
}

export PATH="$HOME/.ghcup/bin:$PATH"
export AUTOENV_FILE_LEAVE=".autoenv.zsh"
export BAT_THEME="TwoDark"
export CHROOT="/home/jasongrace2282/chroot"
export MOZ_DBUS_REMOTE=1 firefox
export ZSH_AUTOSUGGEST_STRATEGY=history
export MOZ_ENABLE_WAYLAND=0
# export GDK_BACKEND=x11

# autoload predict-on
# predict-on

bindkey "\t" autosuggest-accept
bindkey "^[[3~" delete-char # otherwise delete creates tilda

plugins=(
  z
  sudo
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
)


# color stuff
alias ll='ls -a --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nmcli='nmcli --color yes -p'
alias cat='bat -pp'

# config aliases  
alias rconf='exec zsh'
alias conf='nvim ~/.config/.zshrc'
alias nconf='\cd ~/.config/nvim; nvim init.lua'
alias aconf='\cd ~/.config/awesome; nvim rc.lua'
alias iconf='\cd ~/.config/i3; nvim config'
alias dns='bat -pp /etc/resolv.conf'
alias pwd='print -P %~'
alias settings='python ~/repos/simple_settings_gui/settings_gui.py'
alias venv='source .venv/bin/activate; echo "Activated Virtual Environment with $(python --version)!"'

# lazyness of typing
alias shell='poetry shell'
alias pi='poetry install'
alias ff="firefox"
alias cd='z'
alias l='deactivate'
alias :q='exit'
alias html='make html'
alias copy='xclip -sel clip'
alias pkglist='bat /etc/pkglist.txt' # from hook
alias pkgcount='wc -l /etc/pkglist.txt'
alias printer='system-config-printer &> /tmp/printer.log'

# git stuff
alias ga='git add'
alias gpo='git pull origin'
alias gc='git commit'
alias gca='git commit -a'
alias gppo='git push origin'
alias gs='git status'
alias gl='git log --oneline'


alias sudo='sudo ' # evaluate aliases after sudo

alias neofetch='fastfetch'

# kittens
alias icat='kitten icat'
alias d='kitten diff'

export KITTY_SHELL_INTEGRATION="enabled"

source ~/zsh/zsh-z/zsh-z.plugin.zsh
source ~/zsh/sudo/sudo.zsh
source ~/zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/zsh/history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/zsh-autoenv/autoenv.zsh
source ~/zsh/poetry.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
