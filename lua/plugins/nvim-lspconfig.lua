return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      millet = {
        root_dir = function(bufnr, on_dir)
          local util = require("lspconfig.util")
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root = util.root_pattern("millet.toml", "sources.mlb", "sources.cm", ".git")(fname)
          on_dir(root or util.find_git_ancestor(fname) or vim.fn.getcwd())
        end,
      },
    },
  },
}
