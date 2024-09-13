vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

require("config.lazy")

vim.opt.clipboard = 'unnamedplus'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {"lua", "javascript", "c", "ruby", "go", "html"},
  highlight = { enable = true },
  indent = { enable = true },
})

