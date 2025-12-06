# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/ohzsh"
ZSH_THEME="Chicago95"
plugins=(brew lol git gitignore docker-compose zoxide fzf eza)
source $ZSH/oh-my-zsh.sh

# globals
export EDITOR="hx"

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

# aliases
alias lg="lazygit"
