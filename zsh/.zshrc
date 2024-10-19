ZSHCONFIG="$HOME/.config/zsh"

source $ZSHCONFIG/sshenv.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source $ZSHCONFIG/func.zsh

source $ZSHCONFIG/env.zsh

source $ZSHCONFIG/bindkeys.zsh

source $ZSHCONFIG/configalias.zsh

source $ZSHCONFIG/aliases.zsh

# git stuff
source $ZSHCONFIG/git.zsh


source $ZSHCONFIG/plugins.zsh
unset ZSHCONFIG

fpath+="$HOME/.zsh-completions"
