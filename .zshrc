export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/ohzsh"
ZSH_THEME="geoffgarside"

plugins=(
  brew lol git gitignore docker-compose
  zoxide fzf eza kubectl golang
)

# globals
export EDITOR="hx"

# paths
path+=(
  $HOME/.local/bin
  $HOME/go/bin
  $HOME/.bun/bin
)

# aliases
alias lg="lazygit"
alias cat="bat"
alias ze="zellij"

source $ZSH/oh-my-zsh.sh


# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"

# Added by codebase-memory-mcp install
export PATH="/Users/dan/.local/bin:$PATH"
