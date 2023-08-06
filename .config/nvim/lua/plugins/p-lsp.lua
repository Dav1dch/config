local M = {}

M = {
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {
        "folke/trouble.nvim",
        opts = {
          use_diagnostic_signs = true,
          action_keys = {
            close = "<esc>",
            previous = "u",
            next = "e"
          },
        },
      },
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          vim.cmd([[MasonInstall]])
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'j-hui/fidget.nvim',
        tag = "legacy"
      },
      "folke/neodev.nvim",
      "ray-x/lsp_signature.nvim",
      {
        "lvimuser/lsp-inlayhints.nvim",
        branch = "anticonceal",
      },
      -- "mjlbach/lsp_signature.nvim",
    },

    config = function()
      local lsp = require('lsp-zero').preset({})
      M.lsp = lsp

      lsp.ensure_installed({
        'tsserver',
        'lua_ls',
        'pylsp',
        'clangd'

      })


      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        client.server_capabilities.semanticTokensProvider = nil
        -- require("config.plugins.autocomplete").configfunc()
        vim.diagnostic.config({
          severity_sort = true,
          underline = true,
          signs = true,
          virtual_text = true,
          update_in_insert = false,
          float = true,
        })
      end)

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.set_server_config({
        on_init = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      })

      lsp.format_on_save({
        format_opts = {
          -- async = false,
          -- timeout_ms = 10000,
        },
      })


      local lspconfig = require('lspconfig')

      require("config.lsp.lua").setup(lspconfig, lsp)
      require("config.lsp.pylsp").setup(lspconfig, lsp)
      require("config.lsp.clangd").setup(lspconfig, lsp)

      lsp.setup()
      require("fidget").setup({})

      local lsp_defaults = lspconfig.util.default_config
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )



      local format_on_save_filetypes = {
        dart = true,
        json = true,
        go = true,
        lua = true,
        python = true,
        c = true,
        cc = true,
        cpp = true,
        h = true,
        hpp = true,
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          if format_on_save_filetypes[vim.bo.filetype] then
            local lineno = vim.api.nvim_win_get_cursor(0)
            vim.lsp.buf.format({ async = false })
            vim.api.nvim_win_set_cursor(0, lineno)
          end
        end,
      })
    end
  },
}

return M

-- { 'williamboman/mason-lspconfig.nvim' },
-- { 'hrsh7th/cmp-nvim-lsp' },


-- {
--   "neovim/nvim-lspconfig",
--   config = function()
--     --
--     -- Set up lspconfig.
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
--     -- Setup language servers.
--     local lspconfig = require("lspconfig")
--     -- lspconfig.jedi_language_server.setup {
--     --   capabilities = capabilities,
--     -- }
--     lspconfig.pyright.setup({
--       capabilities = capabilities,
--     })
--     lspconfig.tsserver.setup({})
--     lspconfig.lua_ls.setup({
--       capabilities = capabilities,
--       settings = {
--         Lua = {
--           runtime = {
--             -- Tell the language server which version of Lua you're using
--             -- (most likely LuaJIT in the case of Neovim)
--             version = "LuaJIT",
--           },
--           diagnostics = {
--             -- Get the language server to recognize the `vim` global
--             globals = {
--               "vim",
--               "require",
--             },
--           },
--           workspace = {
--             -- Make the server aware of Neovim runtime files
--             library = vim.api.nvim_get_runtime_file("", true),
--             checkThirdParty = false,
--           },
--           -- Do not send telemetry data containing a randomized but unique identifier
--           telemetry = {
--             enable = false,
--           },
--         },
--       },
--     })
--
--     lspconfig.clangd.setup({
--       capabilities = capabilities,
--       settings = {
--         ["filetypes"] = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc" },
--       },
--     })
--
--     lspconfig.rust_analyzer.setup({
--       -- Server-specific settings. See `:help lspconfig-setup`
--       capabilities = capabilities,
--       settings = {
--         ["rust-analyzer"] = {},
--       },
--     })
--   end,
-- },
-- }
