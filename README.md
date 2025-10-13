# Dotfiles

These are my personal dotfiles for setting up a development environment on macOS. They include configurations for Neovim, Ghostty, Starship, and other tools.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/dotfiles.git ~/dotfiles
   ```

2. **Run the installation script:**

   This will install all the necessary applications and tools using Homebrew.

   ```bash
   cd ~/dotfiles
   ./brew_install.sh
   ```

3. **Create symlinks:**

   The `README.md` file contains the necessary commands to create symlinks for the configuration files:

   ```bash
   ln -s ~/dotfiles/ghostty/ ~/.config/ghostty
   ln -s ~/dotfiles/nvim/ ~/.config/nvim
   ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
   ln -s ~/dotfiles/tmux/ ~/.config/tmux
   ln -s ~/dotfiles/zshrc/.zshrc ~/.zshrc
   ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
   ```

4. **Install zsh-syntax-highlighting:**

   Follow the instructions in the `README.md` file to install and enable the `zsh-syntax-highlighting` plugin.

## Configuration

### Neovim

This configuration uses [LazyVim](https://lazyvim.github.io/) as a base and includes a variety of plugins for a better development experience.

- **Theme:** Catppuccin
- **Plugins:**
  - [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)
  - [codesnap.nvim](https://github.com/mistricky/codesnap.nvim)
  - [screenkey.nvim](https://github.com/NStefan002/screenkey.nvim)
  - [snacks.nvim](https://www.google.com/search?q=https://github.com/mrded/snacks.nvim)
  - [vim-test](https://github.com/vim-test/vim-test)
  - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

### Ghostty

The `ghostty/config` file sets the following options:

- **Theme:** Catppuccin Mocha
- **Font:** GeistMono NFM Black
- **Font size:** 19
- **Background opacity:** 0.7
- **Background blur:** 50

### Starship

The `starship.toml` file contains the configuration for the Starship cross-shell prompt, including custom symbols for different tools and environments.
