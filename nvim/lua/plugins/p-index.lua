return {

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  --{ "mhinz/vim-startify" },
  { "p00f/nvim-ts-rainbow" },
  { "lewis6991/gitsigns.nvim" },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end,
  },
  { "rmagatti/alternate-toggler" },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    'lvimuser/lsp-inlayhints.nvim',
    config = function()
      require('lsp-inlayhints').setup()
    end,

  }
}
