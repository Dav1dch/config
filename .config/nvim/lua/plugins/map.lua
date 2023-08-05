vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>q', ':q<CR>')

vim.keymap.set('n', '<leader>w', ':w<CR>')

vim.keymap.set('n', '<c-a>', 'gg<S-v>G')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-f>', builtin.find_files, {})
vim.keymap.set('n', '<c-g>', builtin.live_grep, {})
vim.keymap.set('n', '<c-b>', builtin.buffers, {})
vim.keymap.set('n', '<c-h>', builtin.help_tags, {})

vim.keymap.set('n', 'tn', ':BufferNext<CR>', {})
vim.keymap.set('n', 'tp', ':BufferPrevious<CR>', {})
vim.keymap.set('n', 't1', ':BufferGoto 1<CR>', {})
vim.keymap.set('n', 't2', ':BufferGoto 2<CR>', {})
vim.keymap.set('n', 't3', ':BufferGoto 3<CR>', {})
vim.keymap.set('n', 't4', ':BufferGoto 4<CR>', {})
vim.keymap.set('n', 't5', ':BufferGoto 5<CR>', {})
vim.keymap.set('n', 't6', ':BufferGoto 6<CR>', {})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader><CR>", ":luafile /Users/david/.config/nvim/init.lua<CR>", opts)
