return {
  setup = function(lspconfig, lsp)
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
