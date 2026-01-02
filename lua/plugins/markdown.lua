return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = {}, -- Пустой список = линтер отключен
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      -- Удаляем markdownlint из источников
      opts.sources = vim.tbl_filter(function(source)
        return source.name ~= "markdownlint_cli2"
      end, opts.sources)
    end,
  },
}
