local M = {}

local function opts()
  return {
    cwd = vim.b.snacks_terminal and vim.b.snacks_terminal.cwd or vim.fn.expand("%:p:h"),
    count = 1,
    win = { position = "right", width = 45 },
  }
end

function M.toggle(cmd)
  Snacks.terminal.toggle(cmd, opts())
end

function M.send(cmd, text)
  local win = vim.api.nvim_get_current_win()
  local term = Snacks.terminal.get(cmd, opts())
  if not term then
    return
  end

  term:show()
  vim.api.nvim_win_set_cursor(term.win, { vim.api.nvim_buf_line_count(term.buf), 0 })
  vim.api.nvim_chan_send(vim.b[term.buf].terminal_job_id, text .. "\n")
  vim.api.nvim_set_current_win(win)
  vim.cmd.stopinsert()
end

return M
