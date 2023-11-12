return {
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
}
