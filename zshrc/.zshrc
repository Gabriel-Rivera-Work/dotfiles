# Starship prompt
eval "$(starship init zsh)"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zoxide zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Editor Enviroment variable
export EDITOR="nvim"
export VISUAL="nvim"

# Carapace-bin setup
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
source <(carapace _carapace)
eval "$(carapace _carapace zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Aliases

# Neovim
alias n="nvim"

# VS Code
alias c="code"

# Eza
alias ls="eza -l --icons --git"
alias "ls -a"="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# Zoxide
alias cd="z"

# Lazygit
alias lg="lazygit"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
