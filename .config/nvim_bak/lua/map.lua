vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>q', ':q<CR>')

vim.keymap.set('n', '<leader>w', ':w<CR>')

vim.keymap.set('n', '<c-a>', 'gg<S-v>G')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--fixed-strings", "--smart-case", "--trim",
    },
    layout_config = {
      width = 0.9,
      height = 0.9,
    },
    color_devicons = true,
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    command_palette = command_palette,
  }
})

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
