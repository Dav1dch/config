return {
  "preservim/nerdtree",
  dependencies = {
    { "ryanoasis/vim-devicons" },

  },
  config = function()
    -- vim.keymap.set('n', '<c-e>', ':NERDTreeToggle<CR>')
    vim.keymap.set('n', '<c-e>', ':Joshuto<CR>')

    vim.api.nvim_create_autocmd("StdinReadPre", { pattern = "*", command = "let s:std_in=1" })
    vim.api.nvim_create_autocmd("VimEnter",
      {
        pattern = "*",
        command =
        "if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'Joshuto'",
        -- "if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'Joshuto' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif",
      })
  end
}
