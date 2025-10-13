return {
  "snacks.nvim",
  opts = {
    indent = { enabled = false },
    dashboard = {
      preset = {
        header = [[
           _  _     ___     ___   __   __   ___   __  __  
    o O O | \| |   | __|   / _ \  \ \ / /  |_ _| |  \/  | 
   o      | .` |   | _|   | (_) |  \ V /    | |  | |\/| | 
  TS__[O] |_|\_|   |___|   \___/   _\_/_   |___| |_|__|_| 
 {======|_|"""""|_|"""""|_|"""""|_| """"|_|"""""|_|"""""| 
./o--000'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' 

Hello Again!!
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
