return {
	"kevinhwang91/nvim-hlslens",
	"nvim-pack/nvim-spectre",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			label = { before = false, after = true, style = "overlay", min_pattern_length = 2, bold = true },
			modes = {
				treesitter = {
					label = {
						before = true,
						after = false,
						style = "overlay",
						bold = true,
					},
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local open_with_trouble = require("trouble.sources.telescope").open

			telescope.setup({
				defaults = {
					path_display = { "truncate" },
					layout_strategy = "vertical",
					wrap_results = true,
					layout_config = {
						vertical = { width = 0.999, height = 0.999 },
						horizontal = { width = 0.999, height = 0.999 },
					},
					cache_picker = {
						num_pickers = 10,
						limit_entries = 20,
					},
					file_ignore_patterns = {
						"node_modules",
						"package%-lock.json",
					},
					mappings = {
						i = {
							["<C-l>"] = actions.move_selection_previous,
							["<C-k>"] = actions.move_selection_next,
							["<C-t>"] = open_with_trouble,
						},
					},
					vimgrep_arguments = {
						"rg",
						"--with-filename",
						"--column",
						"--smart-case",
						"--trim",
					},
				},
				pickers = {
					buffers = {
						show_all_buffers = true,
						sort_mru = true,
						mappings = {
							i = {
								["<c-d>"] = "delete_buffer",
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,
	},
}
