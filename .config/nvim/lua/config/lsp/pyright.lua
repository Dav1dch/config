return {
  setup = function(lspconfig, lsp)
    require("neodev").setup({
      lspconfig = true,
      override = function()
      end
    })
    lspconfig.pyright.setup({
      on_attach = function()
      end,
      settings = {
        pyright = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'openFilesOnly',
          },
        },

        completion = {
          callSnippet = "Replace"
        }
      },
    })
  end
}
