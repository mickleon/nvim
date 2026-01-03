return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          html = { "djlint" },
          htmldjango = { "djlint" },
        },
        formatters = {
          djlint = {
            append_args = { "--indent", "2", "--indent-css", "2", "--indent-js", "2" },
          },
        },
      }
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "djlint",
      })
    end,
  },
}
