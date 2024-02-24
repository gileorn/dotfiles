return {
	"f-person/git-blame.nvim",
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = false,
		},
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			local actions = require("diffview.actions")

			require("diffview").setup({
				keymaps = {
					view = {
						["o"] = actions.goto_file_edit,
					},
					file_panel = {
						["o"] = actions.goto_file_edit,
						["k"] = actions.select_next_entry,
						["l"] = actions.select_prev_entry,
						["?"] = "<Cmd>h diffview-maps-file-panel<CR>",
					},
					file_history_panel = {
						["o"] = actions.goto_file_edit,
						["k"] = actions.select_next_entry,
						["l"] = actions.select_prev_entry,
						["?"] = "<Cmd>h diffview-maps-file-history-panel<CR>",
					},
				},
				view = {
					default = {
						layout = "diff2_horizontal",
					},
				},
				file_panel = {
					listing_style = "tree",
					tree_options = {
						flatten_dirs = true,
						folder_statuses = "only_folded",
					},
					win_config = {
						position = "bottom",
						height = 15,
					},
				},
			})
		end,
	},
}
