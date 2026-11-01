return {
  "neovim/nvim-lspconfig",
  init = function()
    -- HLS answers inlayHint with RequestFailed (-32803) while the file
    -- doesn't parse; don't spam notifications for that
    local method = "textDocument/inlayHint"
    local handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, ...)
      if err and err.code == vim.lsp.protocol.ErrorCodes.RequestFailed then
        return
      end
      return handler(err, ...)
    end
  end,
  opts = {
    servers = {
      -- HLS is started by haskell-tools.nvim
      hls = { enabled = false },
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
