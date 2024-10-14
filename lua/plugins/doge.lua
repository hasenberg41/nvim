return {
  "kkoomen/vim-doge",
  build = ":call doge#install()",
  config = function()
    vim.keymap.set('n', '<leader>d', ':DogeGenerate<CR>', {})
  end
}
