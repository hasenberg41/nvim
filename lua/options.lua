vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd([[
  :set nu
  :augroup numbertoggle
    :autocmd!
    :autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    :autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  :augroup END
]])
vim.g.mapleader = " "

vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
  pattern = "*",
  command = "set guicursor=a:ver25-blinkon1"
})

-- Setup system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
