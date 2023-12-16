# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function battery ()
{
  echo "Battery: "
  echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
}

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

# config aliases  
alias rconf='source ~/.zshrc && exec zsh'
alias conf='nvim ~/.zshrc'
alias nconf='cd ~/.config/nvim && nvim init.lua'
alias aconf='cd ~/.config/awesome && nvim rc.lua'
alias dns='cat /etc/resolv.conf'
alias update='pacman -Syu'
alias pwd='print -P %~'

# lazyness of typing
alias sp='setprompt'
alias lg='lazygit'
alias ps='poetry shell'
alias pi='poetry install'
alias ff="firefox"

alias sudo='sudo ' # evaluate aliases after sudo

# kittems
alias icat='kitten icat'
alias d='kitten diff'

export KITTY_SHELL_INTEGRATION="enabled"

source ~/zsh/zsh-z/zsh-z.plugin.zsh
source ~/zsh/sudo/sudo.zsh
source ~/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/zsh-autoenv/autoenv.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# load last
source ~/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
