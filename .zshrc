# globals
export EDITOR="hx"

# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/ohzsh"
ZSH_THEME="gallifrey"

plugins=(
  brew lol git gitignore docker-compose
  zoxide fzf eza kubectl golang tmux
)

source $ZSH/oh-my-zsh.sh


# paths
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/home/dvill/.bun/_bun" ] && source "/home/dvill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# aliases
alias lg="lazygit"
alias cat="bat"
