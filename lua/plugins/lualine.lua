local icons = LazyVim.config.icons

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { "snacks_picker_list", "dashboard", "alpha", "ministarter", "snacks_dashboard" },
      },
    },
    sections = {
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 1, right = 1 } },
      },
      lualine_z = {
        { "encoding" },
      },
    },
  },
}
