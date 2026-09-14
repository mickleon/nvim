local Terminal = require("toggleterm.terminal").Terminal

local M = {}
local repl = nil

local function create(dir)
  repl = Terminal:new({
    cmd = "sml",
    dir = dir,
    direction = "horizontal",
    close_on_exit = true,
    on_exit = function()
      repl = nil
    end,
  })
end

function M.toggle()
  local dir = vim.fn.expand("%:p:h")

  if not repl then
    create(dir)
  else
    repl.dir = dir
  end

  repl:toggle()
end

function M.send_use()
  local dir = vim.fn.expand("%:p:h")
  local filename = vim.fn.expand("%:t")
  local cmd = string.format('use "%s";', filename)

  if repl and repl:is_open() then
    repl:send(cmd, true)
    return
  end

  if not repl then
    create(dir)
  else
    repl.dir = dir
  end

  repl:open()
  vim.defer_fn(function()
    if repl and repl:is_open() then
      repl:send(cmd, true)
    end
  end, 500)
end

return M
