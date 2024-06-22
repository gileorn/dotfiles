return {
	"folke/zen-mode.nvim",
	"kyazdani42/nvim-web-devicons",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
				lualine_z = { "branch" },
			},
			options = {
				padding = 1,
				section_separators = { left = " ", right = " " },
				component_separators = { left = " ", right = " " },
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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
