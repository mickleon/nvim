return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = nil,
    },
    formatters = {
      djlint = {
        append_args = { "--indent", "2", "--indent-css", "2", "--indent-js", "2" },
      },
    },
  },
}
