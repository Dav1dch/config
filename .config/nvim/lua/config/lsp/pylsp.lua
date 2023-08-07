return {
  setup = function(lspconfig, lsp)
    require("neodev").setup({
      lspconfig = true,
      override = function()
      end
    })
    lspconfig.pylsp.setup({
      on_attach = function()
      end,
      settings = {
        pylsp = {
          plugins = {
            yapf = { enabled = false },
            rope_completion = { enabled = false },
            pycodestyle = { enabled = false },
            pylint = { enabled = false },
            preload = { enabled = false },
            mccabe = { enabled = false },

          }

        },
        completion = {
          callSnippet = "Replace"
        }
      }
    })
  end
}
