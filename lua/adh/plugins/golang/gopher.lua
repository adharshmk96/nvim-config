return {
	"olexsmir/gopher.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "go" },
	config = function()
		require("gopher").setup()
	end,
	build = function()
		vim.cmd([[silent! GopherInstall]])
	end,
}
