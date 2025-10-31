return {
  "fmbarina/multicolumn.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    base_set = {
      scope = "window",
      rulers = { 80 },
      to_line_end = true,
      bg_color = "#b388eb",
      fg_color = "#17172e",
    },
  },
}
