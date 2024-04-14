-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "[W]indow split vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "[W]indow split horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "[W]indow make splits equal" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "[W]indow close current split" }) -- close current split window

keymap.set("n", "<leader>ol", "<cmd>Lazy<CR>", { desc = "[O]pen [L]azy" }) -- open lazygit
keymap.set("n", "<leader>om", "<cmd>Mason<CR>", { desc = "[O]pen [M]ason" }) -- open mason

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[T]ab open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab go to next tab" }) -- go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab go to previous tab" }) -- go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "[T]ab open current file in new tab" }) -- open file in new tab
