return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({})

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        -- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      end

      function _G._run_rspec_current_file()
        local file = vim.fn.expand("%")
        local term_cmd = "rspec " .. file
        require("toggleterm").exec(term_cmd, 1, 12, vim.o.shell, "horizontal")
      end

      function _G._run_rspec_all()
        local term_cmd = "rspec"
        require("toggleterm").exec(term_cmd, 1, 12, vim.o.shell, "horizontal")
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://*toggleterm* lua set_terminal_keymaps()")

      vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=float<CR>", {})
      vim.keymap.set("n", "<leader>t", ":lua _run_rspec_current_file()<CR>", {})
      vim.keymap.set("n", "<leader>T", ":lua _run_rspec_all()<CR>", {})
    end,
  },
}
