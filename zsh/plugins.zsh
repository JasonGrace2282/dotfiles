plugins=(
  z
  sudo
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
)

source ~/zsh/zsh-z/zsh-z.plugin.zsh
source ~/zsh/sudo/sudo.zsh
source ~/zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/zsh/history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/zsh-autoenv/autoenv.zsh
# source ~/zsh/poetry.zsh >> /dev/null
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


