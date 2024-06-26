-- buffer remove, improved buffer close with bufferline
return {
	"echasnovski/mini.bufremove",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>bx",
			function()
				local bd = require("mini.bufremove").delete
				if vim.bo.modified then
					local choice =
						vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
					if choice == 1 then -- Yes
						vim.cmd.write()
						bd(0)
					elseif choice == 2 then -- No
						bd(0, true)
					end
				else
					bd(0)
				end
			end,
			desc = "[B]uffer [X] current",
		},
      -- stylua: ignore
      { "<leader>bX", function() require("mini.bufremove").delete(0, true) end, desc = "[B]uffer force [X] current" },
	},
}
