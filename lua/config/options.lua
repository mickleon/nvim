-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.spelllang = { "ru", "en" }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.vimtex_syntax_conceal_disable = 1

vim.opt.listchars.trail = "·"
vim.opt.listchars.nbsp = "␣"
vim.opt.listchars.extends = "»"
vim.opt.listchars.precedes = "«"

vim.g.ai_cmp = false
