return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			float_opts = { width = 1000, height = 1000 },
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		local gotop = Terminal:new({ cmd = "gotop", hidden = true, direction = "float" })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		function _gotop_toggle()
			gotop:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>gg",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ desc = "Open lazygit", noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>a",
			"<cmd>lua _gotop_toggle()<CR>",
			{ desc = "Open gotop", noremap = true, silent = true }
		)
	end,
}
