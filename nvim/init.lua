-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  vim.opt.clipboard = "unnamedplus"

  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"
else
  require("config.lazy")
  vim.cmd.colorscheme("catppuccin")
  vim.g.snacks_animate = false
end
