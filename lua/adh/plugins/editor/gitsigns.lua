return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Goto Next Hunk")
			map("n", "[h", gs.prev_hunk, "Goto Prev Hunk")

			-- Actions
			map("n", "<leader>hs", gs.stage_hunk, "[H]unk stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "[H]unk reset hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "[H]unk stage hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "[H]unk reset hunk")

			map("n", "<leader>hS", gs.stage_buffer, "[H]unk stage buffer")
			map("n", "<leader>hR", gs.reset_buffer, "[H]unk reset")

			map("n", "<leader>hu", gs.undo_stage_hunk, "[H]unk undo stage hunk")

			map("n", "<leader>hp", gs.preview_hunk, "[H]unk preview hunk")

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "[H]unk blame line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "[H]unk toggle current line blame")

			map("n", "<leader>hd", gs.diffthis, "[H]unk diff this")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "[H]unk diff this (cached)")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "[H]unk select hunk")
		end,
	},
}
