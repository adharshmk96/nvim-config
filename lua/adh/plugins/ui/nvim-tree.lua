return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			disable_netrw = true, -- disable netrw completely to prevent conflicts
			hijack_netrw = true, -- hijack netrw window on startup to prevent it from opening
			hijack_cursor = true, -- hijack cursor in netrw buffer to prevent it from moving
			hijack_unnamed_buffer_when_opening = false, -- hijack unnamed buffer when opening new file
			sync_root_with_cwd = true, -- sync tree root dir with cwd
			update_focused_file = {
				enable = true, -- update the focused file on `BufEnter`
				update_root = false, -- update the root directory of the tree to the one of the focused file
			},
			view = {
				width = 35,
				relativenumber = true,
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
			filesystem_watchers = {
				enable = true,
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					resize_window = true, -- resize window to fit file
					-- window_picker = {
					-- 	enable = false, -- disable window picker
					-- },
				},
			},
			-- change folder arrow icons
			renderer = {
				root_folder_label = false,
				-- highlight_git = false,
				-- highlight_opened_files = "none",

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
