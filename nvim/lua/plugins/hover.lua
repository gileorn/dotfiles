return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.lsp")
			end,
			preview_opts = {
				border = nil,
			},
			preview_window = false,
			title = true,
		})
	end,
}
