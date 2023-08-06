return {
  setup = function(lspconfig, lsp)
    require("neodev").setup({
      lspconfig = true,
      override = function()
      end
    })
    lspconfig.clangd.setup({
      on_attach = function()
      end,
      settings = {
        clangd = {
          ["filetypes"] = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc" },
          workspace = {
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
  end
}
