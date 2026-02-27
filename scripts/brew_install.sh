#!/usr/bin/env bash
# =============================================================================
# Install Homebrew and all packages from Brewfile
# =============================================================================
set -e

DOTFILES_DIR="$HOME/dotfiles"

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon
  if [[ $(uname -m) == "arm64" ]]; then
    echo "🔧 Adding Homebrew to PATH for Apple Silicon..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo "📦 Updating Homebrew..."
brew update

echo "📦 Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile" --no-lock

echo "🧹 Cleaning up..."
brew cleanup

echo "✅ Homebrew installation complete!"
