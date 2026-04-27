# ═══════════════════════════════════════════════════════════
# Section 1: PATH and Environment
# ═══════════════════════════════════════════════════════════

# Add user bin directories to PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# ═══════════════════════════════════════════════════════════
# Section 2: Completion and Plugins
# ═══════════════════════════════════════════════════════════
autoload -Uz compinit
compinit -C

zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
ANTIDOTE_ZSH="$(brew --prefix antidote)/share/antidote/antidote.zsh"
if [[ -f "$ANTIDOTE_ZSH" ]]; then
  source "$ANTIDOTE_ZSH"
  if [[ -f ${zsh_plugins}.txt && ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  fi
  [[ -f ${zsh_plugins}.zsh ]] && source ${zsh_plugins}.zsh
fi

# ═══════════════════════════════════════════════════════════
# Section 3: Starship Prompt
# ═══════════════════════════════════════════════════════════
# Keep Starship last so it owns the final prompt state.
eval "$(starship init zsh)"

# ═══════════════════════════════════════════════════════════
# Section 4: Completions and Aliases
# ═══════════════════════════════════════════════════════════
# Completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Neovim
alias n="nvim"

# VS Code
alias c="code"

# Opencode
alias oc="opencode"

# Eza
alias ls="eza -l --icons --git"
alias lsa="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2 --icons --git"

# Lazygit
alias lg="lazygit"

# Zoxide
alias cd="z"

# Brew
alias buu="brew update && brew upgrade && brew cleanup"

# Kanata
alias kanata-reset="sudo launchctl unload /Library/LaunchDaemons/com.kanata.daemon.plist && sudo launchctl load /Library/LaunchDaemons/com.kanata.daemon.plist"
alias kanata-load="sudo launchctl load /Library/LaunchDaemons/com.kanata.daemon.plist"
alias kanata-unload="sudo launchctl unload /Library/LaunchDaemons/com.kanata.daemon.plist"

# ═══════════════════════════════════════════════════════════
# Section 5: Zoxide, NVM, and Local Environment
# ═══════════════════════════════════════════════════════════
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
