return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "[B]uffer [P]in" },
		{ "<leader>bpx", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "[B]uffer close un[P]inned" },
		{ "<leader>box", "<Cmd>BufferLineCloseOthers<CR>", desc = "[B]uffer [X] others" },
		{ "<leader>brx", "<Cmd>BufferLineCloseRight<CR>", desc = "[B]uffer delete to [R]ight" },
		{ "<leader>blx", "<Cmd>BufferLineCloseLeft<CR>", desc = "[B]uffer delete to [L]eft" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				separator_style = "slant",
				close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
				-- always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = require("lazyvim.config").icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
					},
				},
			},
		})

		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
