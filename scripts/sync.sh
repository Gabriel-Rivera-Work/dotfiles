#!/usr/bin/env bash
# =============================================================================
# Sync — capture current state from this machine into the dotfiles repo
# =============================================================================
# Run this whenever you change settings and want to commit them.
# Usage: bash ~/dotfiles/scripts/sync.sh
# =============================================================================
set -e

DOTFILES_DIR="$HOME/dotfiles"
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

echo "🔄 Syncing current settings into dotfiles repo..."

# ---- Brewfile ----
echo "  📦 Dumping Brewfile..."
brew bundle dump --file="$DOTFILES_DIR/Brewfile" --force

# ---- VS Code settings (only if they're NOT already symlinked) ----
if [ -f "$VSCODE_USER_DIR/settings.json" ] && [ ! -L "$VSCODE_USER_DIR/settings.json" ]; then
  echo "  📝 Copying VS Code settings.json..."
  cp "$VSCODE_USER_DIR/settings.json" "$DOTFILES_DIR/vscode/settings.json"
fi
if [ -f "$VSCODE_USER_DIR/keybindings.json" ] && [ ! -L "$VSCODE_USER_DIR/keybindings.json" ]; then
  echo "  📝 Copying VS Code keybindings.json..."
  cp "$VSCODE_USER_DIR/keybindings.json" "$DOTFILES_DIR/vscode/keybindings.json"
fi

# ---- Karabiner (if not symlinked) ----
KARABINER_SRC="$HOME/.config/karabiner/karabiner.json"
if [ -f "$KARABINER_SRC" ] && [ ! -L "$KARABINER_SRC" ]; then
  echo "  ⌨️  Copying Karabiner config..."
  cp "$KARABINER_SRC" "$DOTFILES_DIR/karabiner/karabiner.json"
fi

# ---- Show git status ----
echo ""
cd "$DOTFILES_DIR"
echo "📋 Changes detected:"
git status --short

echo ""
echo "✅ Sync complete! Review the changes above, then:"
echo "   cd ~/dotfiles && git add -A && git commit -m 'sync settings' && git push"
