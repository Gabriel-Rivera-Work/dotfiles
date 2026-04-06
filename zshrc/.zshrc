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
autoload -U compinit && compinit
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

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
alias lsa="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# Zoxide
alias cd="z"

# Lazygit
alias lg="lazygit"

# Brew
alias buu="brew update && brew upgrade && brew cleanup"

# Reset Kanata
alias kanata-reset="sudo launchctl unload /Library/LaunchDaemons/com.kanata.daemon.plist && sudo launchctl load /Library/LaunchDaemons/com.kanata.daemon.plist"
alias kanata-load="sudo launchctl load /Library/LaunchDaemons/com.kanata.daemon.plist"
alias kanata-unload="sudo launchctl unload /Library/LaunchDaemons/com.kanata.daemon.plist"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
