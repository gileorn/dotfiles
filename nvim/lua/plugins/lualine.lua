return {
	"nvim-lualine/lualine.nvim",
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "tabs" },
			lualine_y = {},
			lualine_z = { "location" },
		},
		options = {
			disabled_filetypes = { statusline = { "packer", "NvimTree", "Diffview", "DiffviewFiles" } },
		},
	},
}
