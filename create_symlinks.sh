#!/usr/bin/env bash
set -e

echo "Setting SymLinks..."

mkdir -p ~/.config

echo "Ghostty Config..."
ln -sf ~/dotfiles/ghostty/ ~/.config/ghostty

echo "Nvim Config..."
ln -sf ~/dotfiles/nvim/ ~/.config/nvim

echo "Starship Config..."
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

echo "Tmux Config..."
ln -sf ~/dotfiles/tmux/ ~/.config/tmux

echo "Tmux .tmux.conf..."
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Zsh Config..."
ln -sf ~/dotfiles/zshrc/.zshrc ~/.zshrc

echo "✅ All SymLinks completed!"
