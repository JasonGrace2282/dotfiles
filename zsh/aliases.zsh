# color stuff
alias ll='lsd -a'
alias ls='lsd'
alias grep='grep --color=auto'
alias grepi='grep -i --color=auto'
alias nmcli='nmcli --color yes -p'
alias ip='ip --color=auto'
alias cat='bat'

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
alias ds='docker service'
alias dsls='docker service ls'
alias dsi='docker service inspect'
alias dsip='docker service inspect --pretty'
alias dsrm='docker service rm'
alias dsps='docker service ps'
alias dsl='docker service logs'

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
