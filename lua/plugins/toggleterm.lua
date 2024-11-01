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

			local function run_command_in_terminal(cmd)
				require("toggleterm").exec(cmd, 1, 12, vim.o.shell, "horizontal")
			end

			local function is_ruby_file()
				return vim.fn.expand("%:e") == "rb"
			end

			local function run_rspec_current_file()
				if is_ruby_file() then
					local file = vim.fn.expand("%")
					run_command_in_terminal("rspec " .. file)
        else
          print("Not ruby file")
				end
			end

			local function run_rspec_all()
				run_command_in_terminal("rspec")
			end

			local function copy_rspec_command()
				if is_ruby_file() then
          local command = "rspec " .. vim.fn.expand("%")
          vim.fn.setreg("+", command)
          print("Copied to clipboard: " .. command)
        else
          print("Not ruby file")
        end
			end

			local function copy_file_command()
        local filepath = vim.fn.expand("%")
        vim.fn.setreg("+", filepath)
        print("Copied to clipboard: " .. filepath)
			end

			vim.cmd("autocmd! TermOpen term://*toggleterm* lua set_terminal_keymaps()")

			vim.keymap.set("n", "<C-\\>", ":ToggleTerm direction=float<CR>", {})
			vim.keymap.set("n", "<leader>tt", run_rspec_current_file, {})
			vim.keymap.set("n", "<leader>tT", run_rspec_all, {})
			vim.keymap.set("n", "<leader>ty", copy_rspec_command, {})

			vim.keymap.set("n", "<leader>yy", copy_file_command, {})
		end,
	},
}
