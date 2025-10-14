#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/gabrielrivera/dotfiles.git"

echo "🚀 Starting dotfiles installation..."

if ! command -v git &>/dev/null; then
  echo "❌ Git is not installed. Please install git first."
  exit 1
fi

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "📥 Cloning dotfiles repository..."
  git clone "$REPO_URL" "$DOTFILES_DIR" || {
    echo "❌ Failed to clone repository. Please check the URL or your internet connection."
    exit 1
  }
else
  echo "📂 Dotfiles directory already exists. Pulling latest changes..."
  cd "$DOTFILES_DIR"
  git pull || echo "⚠️  Warning: Could not pull latest changes. Continuing with existing files..."
fi

cd "$DOTFILES_DIR"

if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ $(uname -m) == "arm64" ]]; then
      echo "🔧 Adding Homebrew to PATH for Apple Silicon..."
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  fi

  echo "📦 Installing packages with Homebrew..."
  bash "$DOTFILES_DIR/brew_install.sh"
else
  echo "⚠️  Not on macOS. Skipping Homebrew installation."
  echo "   Please install required packages manually:"
  echo "   - neovim, tmux, starship, fzf, ripgrep, fd, eza, zoxide, lazygit"
fi

echo "🔗 Creating symlinks..."
mkdir -p ~/.config

if [ -e ~/.config/ghostty ]; then
  echo "   Backing up existing ghostty config..."
  mv ~/.config/ghostty ~/.config/ghostty.backup.$(date +%Y%m%d_%H%M%S)
fi
ln -sf "$DOTFILES_DIR/ghostty" ~/.config/ghostty
echo "   ✓ Ghostty config linked"

if [ -e ~/.config/nvim ]; then
  echo "   Backing up existing nvim config..."
  mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
fi
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
echo "   ✓ Nvim config linked"

if [ -e ~/.config/starship.toml ]; then
  echo "   Backing up existing starship config..."
  mv ~/.config/starship.toml ~/.config/starship.toml.backup.$(date +%Y%m%d_%H%M%S)
fi
ln -sf "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
echo "   ✓ Starship config linked"

if [ -e ~/.config/tmux ]; then
  echo "   Backing up existing tmux config..."
  mv ~/.config/tmux ~/.config/tmux.backup.$(date +%Y%m%d_%H%M%S)
fi
ln -sf "$DOTFILES_DIR/tmux" ~/.config/tmux
echo "   ✓ Tmux config linked"

if [ -f "$DOTFILES_DIR/zshrc/.zshrc" ]; then
  if [ -e ~/.zshrc ]; then
    echo "   Backing up existing .zshrc..."
    mv ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
  fi
  ln -sf "$DOTFILES_DIR/zshrc/.zshrc" ~/.zshrc
  echo "   ✓ Zsh config linked"
fi

if [ -d "$DOTFILES_DIR/tmux/plugins/tpm" ]; then
  echo "✓ TPM already installed"
else
  echo "📦 Installing Tmux Plugin Manager (TPM)..."
  mkdir -p "$DOTFILES_DIR/tmux/plugins"
  git clone https://github.com/tmux-plugins/tpm "$DOTFILES_DIR/tmux/plugins/tpm"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your terminal or run: source ~/.zshrc"
echo "   2. Open tmux and press prefix + I to install tmux plugins"
echo "   3. Open nvim - plugins will install automatically"
echo ""
