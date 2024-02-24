return {
	"folke/zen-mode.nvim",
	"nvim-lualine/lualine.nvim",
	"kyazdani42/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
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
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
