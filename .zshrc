fpath+=${ZSH_CUSTOM:-${ZSH:-~/src/.oh-my-zsh}/custom}/plugins/zsh-completions/src

function get_git_branch()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    echo '%2~ '
  else
    echo '%1~ - ('$branch') '
  fi
}

function setprompt()
{
  PROMPT="%{%F{red}%}%n%{%f%}@%{%F{yellow}%}%m %{%F{cyan}%}$(get_git_branch)%{$%f%}%  "
}
precmd_functions+=setprompt
setprompt

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
alias rconf='source ~/.zshrc'
alias conf='nvim ~/.zshrc'
alias nconf='z ~/.config/nvim && nvim init.lua'
alias dns='nvim /etc/resolv.conf'
alias update='pacman -Syu'

# lazyness of typing
alias sp='setprompt'
alias lg='lazygit'
alias ps='poetry shell'
alias pi='poetry install'

alias cd='z'
alias sudo='sudo ' # evaluate aliases after sudo
alias z1='zathura --page=1'

export KITTY_SHELL_INTEGRATION="enabled"

source ~/src/.zsh/z/z.zsh
source ~/src/.zsh/sudo/sudo.zsh
source ~/src/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
s
