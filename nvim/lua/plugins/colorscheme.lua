return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    on_colors = function(colors)
      colors.bg = "#000000"
      colors.bg_float = "#000000"
      colors.bg_popup = "#000000"
      colors.bg_sidebar = "#000000"
      colors.bg_statusline = "#000000"
      colors.bg_diff = "#000000"
      colors.bg_dir = "#000000"
      colors.fold_bg = "#000000"
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
