return{
	"preservim/nerdtree",
	config = function()

vim.keymap.set('n', '<c-e>', ':NERDTreeToggle<CR>')

vim.api.nvim_create_autocmd("StdinReadPre", { pattern = "*", command = "let s:std_in=1" })
vim.api.nvim_create_autocmd("VimEnter",
  {
    pattern = "*",
    command =
    "if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif",
  })
		end
}
