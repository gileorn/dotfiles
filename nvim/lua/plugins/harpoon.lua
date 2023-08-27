require("harpoon").setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 60,
	},
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- this was hl for Harpoon List and ha for Harpoon Add
-- but then I moved from hjkl to jkl; and muscle memory stuck
vim.keymap.set("n", "<leader>ja", mark.add_file)
vim.keymap.set("n", "<leader>j;", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(4)
end)
