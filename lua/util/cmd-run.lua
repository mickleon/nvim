local Terminal = require("toggleterm.terminal").Terminal

local M = {}
local terms = {}

local function get(cmd)
  local dir = vim.fn.expand("%:p:h")

  if not terms[cmd] then
    terms[cmd] = Terminal:new({
      cmd = cmd,
      dir = dir,
      direction = "horizontal",
      close_on_exit = true,
      on_exit = function()
        terms[cmd] = nil
      end,
    })
  else
    terms[cmd].dir = dir
  end

  return terms[cmd]
end

function M.toggle(cmd)
  get(cmd):toggle()
end

function M.send(cmd, text)
  local term = terms[cmd]

  if term and term:is_open() then
    term:send(text, true)
    return
  end

  term = get(cmd)
  term:open()
  vim.defer_fn(function()
    if terms[cmd] and terms[cmd]:is_open() then
      terms[cmd]:send(text, true)
    end
  end, 500)
end

return M
