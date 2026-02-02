# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zstyle :compinstall filename '/home/art/.zshrc'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


[[ ! -f ~/.dotfiles/.aliases ]] || source ~/.dotfiles/.aliases
[[ ! -f ~/.dotfiles/.sensitive ]] || source ~/.dotfiles/.sensitive

# Configs for command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

autoload -Uz compinit
compinit

source ~/zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

setopt interactivecomments
# fnm
FNM_PATH="/home/art/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

eval "$(zoxide init zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

source ~/zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source ~/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



