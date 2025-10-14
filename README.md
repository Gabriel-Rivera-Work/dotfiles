# Dotfiles

These are my personal dotfiles for setting up a development environment on macOS. They include configurations for Neovim, Ghostty, Starship, Tmux, and other tools.

## Quick Installation

Run this one-liner to install everything on a fresh machine:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/your-username/dotfiles/main/install.sh)
```

Or clone and install manually:

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installation script will:

- Clone the dotfiles repository (if not already present)
- Install Homebrew (macOS only)
- Install all required packages and applications
- Create symlinks for all configuration files (backing up existing configs)
- Install Tmux Plugin Manager (TPM)

## Post-Installation

After running the installation script:

1. **Restart your terminal** or run:

   ```bash
   source ~/.zshrc
   ```

2. **Install Tmux plugins:**
   - Open tmux: `tmux`
   - Press `prefix + I` (default prefix is `Ctrl+b`) to install plugins

3. **Open Neovim:**
   - Run `nvim`
   - Plugins will install automatically via Lazy.nvim

## Manual Installation

If you prefer to install components individually:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/gabyriv/dotfiles.git ~/dotfiles
   ```

2. **Install Homebrew packages:**

   ```bash
   cd ~/dotfiles
   ./brew_install.sh
   ```

3. **Create symlinks:**

   ```bash
   ./create_symlinks.sh
   ```

## What's Included

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
