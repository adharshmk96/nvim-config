return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		require("which-key").setup()

		-- Document keybindings
		require("which-key").register({
			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[D]iagnostics", _ = "which_key_ignore" },
			["<leader>x"] = { name = "Trouble Dialog", _ = "which_key_ignore" },
			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },

			["<leader>r"] = { name = "[R]e", _ = "which_key_ignore" },

			["<leader>w"] = { name = "[W]indow", _ = "which_key_ignore" },
			["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
			["<leader>e"] = { name = "[E]xplorer", _ = "which_key_ignore" },
			["<leader>f"] = { name = "[F]ile Tree", _ = "which_key_ignore" },

			["<leader>h"] = { name = "[H]unk Git", _ = "which_key_ignore" },
			["<leader>l"] = { name = "[L]azy git", _ = "which_key_ignore" },
		})
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
