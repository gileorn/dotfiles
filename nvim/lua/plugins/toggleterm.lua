local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
	lazygit:toggle()
end

require("toggleterm").setup()

vim.api.nvim_set_keymap(
	"n",
	"<leader>gg",
	"<cmd>lua _lazygit_toggle()<CR>",
	{ desc = "Open lazygit", noremap = true, silent = true }
)
