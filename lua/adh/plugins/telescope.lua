return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		-- { "nvim-telescope/telescope-ui-select.nvim " },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		local builtin = require("telescope.builtin")
		-- Slightly advanced example of overriding default behavior and theme
		keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.tele
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles in dir" })
		keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch [R]ecent files" })

		keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch string, [G]rep in dir" })
		keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord in dir" })

		keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
		-- keymap.set("n", "<leader>sd", builtin.diagnostic, { desc = "[S]earch [D]iagnostics" })

		keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp tags" })

		keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
