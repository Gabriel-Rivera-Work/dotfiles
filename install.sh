#!/usr/bin/env bash
# =============================================================================
# Dotfiles Installer
# =============================================================================
# One-liner install:
#   bash <(curl -fsSL https://raw.githubusercontent.com/Gabriel-Rivera-Work/dotfiles/main/install.sh)
# =============================================================================
set -e

DOTFILES_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/Gabriel-Rivera-Work/dotfiles.git"

echo "🚀 Starting dotfiles installation..."

# ---- Prerequisites ----
if ! command -v git &>/dev/null; then
  echo "❌ Git is not installed. Please install Xcode CLI tools:"
  echo "   xcode-select --install"
  exit 1
fi

# ---- Clone or pull ----
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "📥 Cloning dotfiles repository..."
  git clone "$REPO_URL" "$DOTFILES_DIR" || {
    echo "❌ Failed to clone repository."
    exit 1
  }
else
  echo "📂 Dotfiles directory exists. Pulling latest changes..."
  cd "$DOTFILES_DIR"
  git pull || echo "⚠️  Could not pull latest. Continuing with existing files..."
fi

cd "$DOTFILES_DIR"

# ---- macOS only ----
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "⚠️  Not on macOS. This dotfiles repo is designed for macOS."
  exit 1
fi

# ---- Step 1: Homebrew & packages ----
echo ""
echo "━━━ Step 1/5: Homebrew & Packages ━━━"
bash "$DOTFILES_DIR/scripts/brew_install.sh"

# ---- Step 2: Symlinks ----
echo ""
echo "━━━ Step 2/5: Symlinks ━━━"
bash "$DOTFILES_DIR/scripts/create_symlinks.sh"

# ---- Step 3: macOS System Preferences ----
echo ""
echo "━━━ Step 3/5: macOS System Preferences ━━━"
read -p "Apply macOS system preferences? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  bash "$DOTFILES_DIR/macos/defaults.sh"
else
  echo "  Skipped macOS defaults. You can run it later:"
  echo "    bash ~/dotfiles/macos/defaults.sh"
fi

# ---- Step 4: Oh My Zsh ----
echo ""
echo "━━━ Step 4/5: Oh My Zsh ━━━"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  ✓ Oh My Zsh already installed"
fi

# Install zsh-syntax-highlighting plugin if missing
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "📦 Installing zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "  ✓ zsh-syntax-highlighting already installed"
fi

# ---- Step 5: Tmux Plugin Manager ----
echo ""
echo "━━━ Step 5/5: Tmux Plugin Manager ━━━"
TPM_DIR="$DOTFILES_DIR/tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  echo "📦 Installing TPM..."
  mkdir -p "$DOTFILES_DIR/tmux/plugins"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  echo "  ✓ TPM already installed"
fi

# ---- Done ----
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Installation complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your terminal (or: source ~/.zshrc)"
echo "   2. Open tmux → press prefix + I to install plugins"
echo "   3. Open nvim → plugins auto-install via Lazy.nvim"
echo "   4. Open VS Code → extensions install via brew bundle"
echo ""
