return {
	"christoomey/vim-tmux-navigator",
	{
		"ThePrimeagen/harpoon",
		opts = {
			menu = {
				width = 120,
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			view = {
				width = 60,
				float = {
					enable = false,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 50,
						height = 35,
						row = 1,
						col = 1,
					},
				},
			},
			-- change folder arrow icons
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			git = {
				ignore = false,
			},
		},
	},
	{
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
	},
}
