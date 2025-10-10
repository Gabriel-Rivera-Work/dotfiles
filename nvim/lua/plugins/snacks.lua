return {
  "snacks.nvim",
  opts = {
    indent = { enabled = false },
    dashboard = {
      preset = {
        header = [[
  _  _     ___     ___   __   __   ___   __  __  
| \| |   | __|   / _ \  \ \ / /  |_ _| |  \/  | 
| .` |   | _|   | (_) |  \ V /    | |  | |\/| | 
|_|\_|   |___|   \___/   _\_/_   |___| |_|__|_| 
_|"""""|_|"""""|_|"""""|_| """"|_|"""""|_|"""""| 
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' 
        ]],
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
    },
  },
}
