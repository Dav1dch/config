-- require('hlchunk').setup({
--   chunk = {
--     enable = true,
--     use_treesitter = true,
--     -- chars = { "│", "¦", "┆", "┊", }, -- more code can be found in https://unicodeplus.com/
--     --
--     -- style = {
--     --   "#8B00FF",
--     -- },
--   },
--   blank = {
--     enable = false,
--   },
--   indent = {
--     enable = false,
--   },
--   line_num = {
--     enable = true,
--   }
-- })

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  -- space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
