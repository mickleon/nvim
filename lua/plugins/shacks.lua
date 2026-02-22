return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            auto_hide = { "input" },
          },
          hidden = true,
          ignored = true,
        },
      },
    },
    indent = {
      indent = {
        hl = "WinSeparator",
      },
      scope = {
        hl = "NonText",
      },
      animate = {
        enabled = false,
      },
    },
    image = {
      doc = {
        max_width = 40,
        max_height = 30,
      },
      math = {
        enabled = false,
      },
    },
  },
}
