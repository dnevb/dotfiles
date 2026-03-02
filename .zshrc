export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/ohzsh"
ZSH_THEME="gallifrey"

plugins=(
  brew lol git gitignore docker-compose
  zoxide fzf eza kubectl golang tmux
)

# globals
export EDITOR="hx"

# paths
export PATH="$HOME/.local/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# aliases
alias lg="lazygit"
alias cat="bat"

source $ZSH/oh-my-zsh.sh
