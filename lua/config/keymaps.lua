-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- Term
local float_term = require("toggleterm.terminal").Terminal:new({
  direction = "float",
  float_opts = {
    width = math.floor(vim.o.columns * 0.5),
    height = math.floor(vim.o.lines * 0.5),
  },
  hidden = true,
})

function _float_toggle()
  float_term:toggle()
end

map("n", [[<C-\>]], "<cmd>lua _float_toggle()<CR>", { desc = "Toggle floating terminal" })
map("t", [[<C-\>]], "<cmd>lua _float_toggle()<CR>", { desc = "Toggle floating terminal" })
