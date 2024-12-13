return {
	{ "projekt0n/github-nvim-theme", name = "github_dark", priority = 1000 },
  { 'dikiaap/minimalist', priority = 1000 },
	-- { "morhetz/gruvbox" },
	{
		"f4z3r/gruvbox-material.nvim",
		config = function()
			require("gruvbox-material").setup({
				italics = true, -- enable italics in general
				contrast = "hard", -- set contrast, can be any of "hard", "medium", "soft"
				comments = {
					italics = true, -- enable italic comments
				},
				background = {
					transparent = true, -- set the background to transparent
				},
				float = {
					force_background = false, -- force background on floats even when background.transparent is set
          --background_color = "#1d2021", -- set color for float backgrounds. If nil, uses the default color set
					-- by the color scheme
				},
				signs = {
					highlight = true, -- whether to highlight signs
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
