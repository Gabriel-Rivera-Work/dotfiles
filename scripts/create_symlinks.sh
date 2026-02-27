#!/usr/bin/env bash
# =============================================================================
# Create Symlinks — links dotfiles configs to their expected locations
# =============================================================================
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Creating symlinks..."
mkdir -p ~/.config

# Helper: backup existing file/dir, then symlink
link() {
  local src="$1"
  local dst="$2"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  Backing up existing $(basename "$dst")..."
    mv "$dst" "${dst}.backup.$(date +%Y%m%d_%H%M%S)"
  fi

  ln -sf "$src" "$dst"
  echo "  ✓ $(basename "$dst")"
}

# ---- Shell ----
link "$DOTFILES_DIR/zshrc/.zshrc"       "$HOME/.zshrc"
link "$DOTFILES_DIR/git/.gitconfig"     "$HOME/.gitconfig"
link "$DOTFILES_DIR/.vimrc"             "$HOME/.vimrc"

# ---- ~/.config apps ----
link "$DOTFILES_DIR/ghostty"            "$HOME/.config/ghostty"
link "$DOTFILES_DIR/nvim"               "$HOME/.config/nvim"
link "$DOTFILES_DIR/starship.toml"      "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/tmux"               "$HOME/.config/tmux"
link "$DOTFILES_DIR/yazi"               "$HOME/.config/yazi"
link "$DOTFILES_DIR/karabiner"          "$HOME/.config/karabiner"

# ---- tmux also expects ~/.tmux.conf ----
link "$DOTFILES_DIR/tmux/.tmux.conf"    "$HOME/.tmux.conf"

# ---- VS Code ----
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "$VSCODE_USER_DIR" ]; then
  link "$DOTFILES_DIR/vscode/settings.json"    "$VSCODE_USER_DIR/settings.json"
  link "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
  echo "  ✓ VS Code settings & keybindings"
else
  echo "  ⚠  VS Code user dir not found — skipping (install VS Code first)"
fi

echo ""
echo "✅ All symlinks created!"
