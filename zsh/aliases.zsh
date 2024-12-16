# color stuff
alias ll='ls -a --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias grepi='grep -i --color=auto'
alias nmcli='nmcli --color yes -p'
alias ip='ip --color=auto'
alias cat='bat -pp'

# lazyness of typing
alias ff="firefox"
alias l='deactivate'
alias :q='exit'
alias pkglist='bat /etc/pkglist.txt' # from hook
alias pkgcount='wc -l /etc/pkglist.txt'
alias printer='system-config-printer &> /tmp/printer.log'
alias deit='docker exec -it'

alias sudo='sudo ' # evaluate aliases after sudo

alias neofetch='fastfetch'

# kittens
alias icat='kitten icat'
alias d='kitten diff'

alias py='python '

# tmux
alias tmxa='tmux attach'
alias tmxat='tmux attach -t'
alias tmxls='tmux ls'

# docker
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcb='docker compose build'
alias dcd='docker compose down'
alias dcdv='docker compose down -v'

# other stuff
alias pmpy='python3 manage.py '
alias pypyrs='python3 manage.py runserver'
alias pmpyt='python3 manage.py test'

alias cbh='echo $PWD/build/html/index.html | copy'

# clear fzf default command
alias fzfcl='FZF_DEFAULT_COMMAND="" fzf'

# uv
alias uvti='uv tool install'
alias uvr='uv run'
for i in {8..13}; do
    alias "uvr$i"="uv run -p3.$i"
done
alias uvnp='uv run --no-project'

privatec="$HOME/.config/zsh/private.zsh"
[ -f $privatec ] && source $privatec
