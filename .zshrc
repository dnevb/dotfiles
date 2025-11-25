eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/ohzsh"
ZSH_THEME="Chicago95"
plugins=(lol git gitignore docker-compose)
source $ZSH/oh-my-zsh.sh

# globals
export EDITOR="hx"

# aliases
alias lg="lazygit"

# paths
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# bun completions
[ -s "/home/dvill/.bun/_bun" ] && source "/home/dvill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
