return {

  { "mhinz/vim-startify" },
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
}
