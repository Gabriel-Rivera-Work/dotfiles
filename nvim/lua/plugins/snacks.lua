local function buildRgCmd(opts)
  local expression = "(" .. table.concat(opts.sign_list, "|") .. "):"

  if opts.match_comment_symbols then
    expression = [[([^\S\r\n]*(]]
      .. table.concat(opts.comment_symbols, "|")
      .. [[)[^\S\r\n]*)\s*(]]
      .. table.concat(opts.sign_list, "|")
      .. [[):\s*]]
  end

  local rg_command = "rg -g '!{**/node_modules/*,**/.git/*}' -w '"
    .. expression
    .. "' "
    .. table.concat(opts.dirs, " ")
    .. " --hidden --follow --sortr modified --no-heading --color never --with-filename --line-number --column"

  return rg_command
end

local function getTodos(opts)
  if next(opts.sign_list) == nil then
    return {}
  end

  local rg_command = buildRgCmd(opts)

  local rg_res = vim.fn.systemlist(rg_command)
  local todos = {}

  local todo_count = 0
  for i, line in pairs(rg_res) do
    todo_count = todo_count + 1
    local filename, row, col, text = line:match("^(.+):(%d+):(%d+):(.*)$")
    local sign_sym = ""

    for _, sign_s in ipairs(opts.sign_list) do
      local start_pos, end_pos = text:find(sign_s .. ":")
      if start_pos then
        sign_sym = text:sub(start_pos, end_pos)
        text = text:sub(end_pos + 1)
      end
    end

    local todo = {
      index = i,
      file = filename:match("^%s*(.-)%s*$"),
      line = row,
      column = col,
      sign = sign_sym,
      desc = text:match("^%s*(.-)%s*$"),
    }
    table.insert(todos, todo)

    if todo_count == opts.limit then
      break
    end
  end

  return todos
end

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
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        {
          pane = 2,
          title = "TODO List",
          padding = 1,
          function()
            local todo_opts = {
              limit = 5,
              match_comment_symbols = true,
              comment_symbols = { "--", "//", "#", "/*" },
              dirs = { vim.fn.getcwd() },
              sign_list = { "TODO", "FIXME", "FIX", "BUG", "HACK", "NOTE" },
            }

            local todos = getTodos(todo_opts)

            if #todos == 0 then
              return {
                { text = "  No TODOs found", hl = "NonText" },
              }
            end

            return vim.tbl_map(function(todo)
              return {
                autokey = true,
                text = {
                  { todo.sign .. string.rep(" ", 8 - #todo.sign), hl = "Special" },
                  {
                    (todo.desc:len() > 40) and todo.desc:sub(1, 40) .. "…" or todo.desc,
                    hl = "Normal",
                  },
                },
                action = function()
                  vim.cmd("edit " .. todo.file)
                  vim.cmd(todo.line)
                end,
              }
            end, todos)
          end,
        },
        { section = "startup" },
      },
    },
  },
}
