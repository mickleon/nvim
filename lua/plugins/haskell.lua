return {
  "mrcjkb/haskell-tools.nvim",
  init = function()
    vim.g.haskell_tools = vim.tbl_deep_extend("force", vim.g.haskell_tools or {}, {
      hls = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        default_settings = {
          haskell = { formattingProvider = "none" },
        },
      },
    })
  end,
}
