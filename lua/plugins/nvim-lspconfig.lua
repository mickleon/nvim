return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      millet = {
        root_dir = function(bufnr, on_dir)
          local util = require("lspconfig.util")
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root = util.root_pattern("millet.toml", "sources.mlb", "sources.cm", ".git")(fname)
          on_dir(root or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1]) or vim.fn.getcwd())
        end,
      },
    },
  },
}
