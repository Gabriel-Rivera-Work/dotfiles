# Dotfiles

Personal dotfiles for macOS — synced between a MacBook Pro M3 (work) and Mac Mini M4 (personal).

## Quick Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Gabriel-Rivera-Work/dotfiles/main/install.sh)
```

Or clone manually:

```bash
git clone https://github.com/Gabriel-Rivera-Work/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer will:

1. Install Homebrew + all packages/casks/fonts from the Brewfile
2. Create symlinks for all config files (with automatic backups)
3. Optionally apply macOS System Preferences (`defaults write`)
4. Install Oh My Zsh + zsh-syntax-highlighting
5. Install Tmux Plugin Manager (TPM)

## What's Included

```
~/dotfiles/
├── Brewfile              # Homebrew packages, casks, fonts, VS Code extensions
├── install.sh            # Main installer (run this on a fresh machine)
├── .gitignore
├── .vimrc                # Vim config (fzf integration)
├── starship.toml         # Starship prompt theme
│
├── ghostty/config        # Ghostty terminal (Catppuccin Mocha)
├── nvim/                 # Neovim (LazyVim-based)
├── tmux/.tmux.conf       # Tmux (Catppuccin, vim-tmux-navigator)
├── zshrc/.zshrc          # Zsh (Oh My Zsh, aliases, tools)
│
├── vscode/
│   ├── settings.json     # VS Code settings (Neovim, Copilot, theme)
│   └── keybindings.json  # VS Code keybindings (LazyVim-style)
│
├── git/.gitconfig        # Git config (aliases, merge, rerere)
├── karabiner/            # Karabiner-Elements (Caps Lock → Escape)
├── yazi/yazi.toml        # Yazi file manager
│
├── macos/defaults.sh     # macOS System Preferences script
│
└── scripts/
    ├── brew_install.sh   # Homebrew installer
    ├── create_symlinks.sh # Symlink creator
    └── sync.sh           # Capture current settings → dotfiles repo
```

## Keeping Settings in Sync

After changing any settings on your work Mac, run:

```bash
bash ~/dotfiles/scripts/sync.sh
```

This captures your current Brewfile, VS Code settings, and Karabiner config into the repo. Then commit and push:

```bash
cd ~/dotfiles && git add -A && git commit -m "sync settings" && git push
```

On your personal Mac, pull the latest:

```bash
cd ~/dotfiles && git pull
```

## Post-Installation

1. **Restart your terminal** or `source ~/.zshrc`
2. **Tmux:** open tmux → press `Ctrl+s` then `I` to install plugins
3. **Neovim:** open `nvim` → plugins auto-install via Lazy.nvim
4. **VS Code:** extensions are installed by `brew bundle`

## Key Tool Configs

### Shell (Zsh)

- **Prompt:** Starship
- **Framework:** Oh My Zsh with git, zoxide, zsh-syntax-highlighting
- **Completions:** Carapace
- **Aliases:** `n` (nvim), `c` (code), `ls` (eza), `cd` (zoxide), `lg` (lazygit), `buu` (brew update+upgrade)

### Neovim

- **Base:** LazyVim
- **Theme:** Catppuccin
- **Plugins:** codecompanion, codesnap, screenkey, snacks, vim-test, vim-tmux-navigator

### VS Code

- **Theme:** Default Dark Modern / Aura Dark
- **Font:** DM Mono, 16px, 1.8 line height
- **Neovim integration** with LazyVim-style keybindings (space leader)
- **Copilot** with custom code generation instructions
- **Key extensions:** GitLens, Prettier, ESLint, ErrorLens, Tailwind CSS

### Ghostty

- **Theme:** Catppuccin Mocha
- **Font:** GeistMono NFM Black, size 19
- **Background:** 0.7 opacity with blur

### Tmux

- **Prefix:** `Ctrl+s`
- **Theme:** Catppuccin Mocha
- **Navigation:** vim-tmux-navigator

### macOS Defaults

The `macos/defaults.sh` script sets preferences for: fast key repeat, tap-to-click, Dock auto-hide, Finder show-all-files, column view, screenshots to ~/Desktop/Screenshots, and more.

### Karabiner-Elements

- Caps Lock → Escape (system-wide)
