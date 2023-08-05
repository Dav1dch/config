return {
  {
    "yaocccc/nvim-hlchunk",
    -- "shellRaining/hlchunk.nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" },
        { pattern = "*", command = "EnableHL", })
      require('hlchunk').setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = "#806d9c" },
          },
        },
        indent = {
          enable = false,
          chars = { "│", "¦", "┆", "┊", },
          use_treesitter = false,
        },
        blank = {
          enable = false,
        },
        line_num = {
          enable = true,
          use_treesitter = true,

        },
      })
    end
  },
  -- {
  -- 	"lukas-reineke/indent-blankline.nvim",
  -- 	opts = {
  -- 		show_current_context = true,
  -- 		show_current_context_start = false,
  -- 	}
  -- },
}

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- require("indent_blankline").setup {
--   -- space_char_blankline = " ",
--   show_current_context = true,
--   show_current_context_start = true,
-- }
