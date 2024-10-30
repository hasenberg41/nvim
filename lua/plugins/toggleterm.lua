return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({})

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
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

      function _G._copy_rspec_command()
        local file = vim.fn.expand("%")
        local command = "rspec " .. file
        vim.fn.setreg("+", command)
        print("Скопировано в буфер обмена: " .. command)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://*toggleterm* lua set_terminal_keymaps()")

      vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=float<CR>", {})
      vim.keymap.set("n", "<leader>tt", ":lua _run_rspec_current_file()<CR>", {})
      vim.keymap.set("n", "<leader>tT", ":lua _run_rspec_all()<CR>", {})
      vim.keymap.set("n", "<leader>ty", ":lua _copy_rspec_command()<CR>", {})
    end,
  },
}
