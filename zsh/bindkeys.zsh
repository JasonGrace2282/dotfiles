bindkey "]]" autosuggest-accept
bindkey "^[[3~" delete-char # otherwise delete creates tilda
autoload -Uz compinit && compinit

