return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "[E]xplorer Focus" }) -- focus file explorer
		keymap.set("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", { desc = "[F]ileTree [T]oggle" }) -- toggle file explorer
		keymap.set("n", "<leader>ff", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "[F]ileTree [F]ind File" }) -- find file in file explorer
		keymap.set("n", "<leader>fc", "<cmd>NvimTreeCollapse<CR>", { desc = "[F]ileTree [C]ollapse" }) -- collapse file explorer
		keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ileTree [R]efresh" }) -- refresh file explorer
	end,
}
