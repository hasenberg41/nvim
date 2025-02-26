return {
  {
    "projekt0n/github-nvim-theme",
    name = "github_dark",
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true
        }
      })

      -- vim.cmd('colorscheme github_dark_dimmed')
    end
  },
  { 'dikiaap/minimalist', priority = 1000 },
  -- { "morhetz/gruvbox" },
  {
    "f4z3r/gruvbox-material.nvim",
    config = function()
      require("gruvbox-material").setup({
        italics = true,    -- enable italics in general
        contrast = "hard", -- set contrast, can be any of "hard", "medium", "soft"
        comments = {
          italics = true,  -- enable italic comments
        },
        background = {
          transparent = true, -- set the background to transparent
        },
        float = {
          force_background = false, -- force background on floats even when background.transparent is set
          background_color = nil,   -- background color for floating windows
          -- by the color scheme
        },
        signs = {
          highlight = false, -- whether to highlight signs
        },
        customize = nil,
      })

      vim.cmd.colorscheme("gruvbox-material")
    end,
    priority = 1000,
  },
  -- { "DeviusVim/deviuspro.nvim" },
  -- { "mikesmithgh/gruvsquirrel.nvim" },
  -- { "Mofiqul/adwaita.nvim" },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000 },
}
