return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({})

      vim.keymap.set("n", "<leader><cr>", ":ToggleTerm direction=float<CR>", {})
    end,
  },
}
