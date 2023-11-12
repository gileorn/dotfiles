return {
	"petertriho/nvim-scrollbar",
	dependencies = { "kevinhwang91/nvim-hlslens", "lewis6991/gitsigns.nvim" },
	init = function()
		require("scrollbar.handlers.search").setup()
		require("scrollbar.handlers.gitsigns").setup()
	end,
	opts = {
		handle = { blend = 30, color = "#92a9e9" },
		handlers = { cursor = false },
		throttle_ms = 50,
	},
}
