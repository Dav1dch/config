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
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', {})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader><CR>", ":luafile /Users/david/.config/nvim/init.lua<CR>", opts)
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>d', ":Telescope lsp_document_symbols<CR>", opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
