export ZSH="$HOME/.oh-my-zsh"
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
  $HOME/.opencode/bin
)

# aliases
alias lg="lazygit"
alias cat="bat"
alias oc="opencode"

source $ZSH/oh-my-zsh.sh
