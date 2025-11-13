eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/ohzsh"
ZSH_THEME="Chicago95"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# globals
export EDITOR="hx"

# paths
export PNPM_HOME="/home/dvill/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.local/bin:$PATH"


