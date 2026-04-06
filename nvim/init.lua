if vim.g.vscode then
  -- VS Code extension
  vim.opt.clipboard = "unnamedplus"

  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"

  local vscode = require("vscode")

  -- LSP Navigation (these call VS Code's native LSP instead of Neovim's)
  vim.keymap.set("n", "gd", function()
    vscode.action("editor.action.revealDefinition")
  end)
  vim.keymap.set("n", "gr", function()
    vscode.action("editor.action.goToReferences")
  end)
  vim.keymap.set("n", "gi", function()
    vscode.action("editor.action.goToImplementation")
  end)
  vim.keymap.set("n", "gt", function()
    vscode.action("editor.action.goToTypeDefinition")
  end)
  vim.keymap.set("n", "gD", function()
    vscode.action("editor.action.peekDefinition")
  end)
else
  -- ordinary Neovim
  require("config.lazy")
end
