# Dotfiles

SymLinks Commands:

`ln -s ~/dotfiles/ghostty/ ~/.config/ghostty`

`ln -s ~/dotfiles/nvim/ ~/.config/nvim`

`ln -s ~/dotfiles/starship.toml ~/.config/starship.toml`

`ln -s ~/dotfiles/tmux/ ~/.config/tmux`

zsh-syntax-highlighting plugin:

1. Clone zsh-syntax-highlighting repository in oh-my-zsh's plugins directory:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

2. Active the plugin in `~/.zshrc`;

```
plugins=( [plugins...] zsh-syntax-highlighting)
```

3. Restart zsh (such as by opening a new instance of your terminal emulator).
