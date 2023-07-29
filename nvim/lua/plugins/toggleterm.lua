require("toggleterm").setup({
	float_opts = { width = 1000, height = 1000 },
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>gg",
	"<cmd>lua _lazygit_toggle()<CR>",
	{ desc = "Open lazygit", noremap = true, silent = true }
)
