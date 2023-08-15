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
			layout = "diff2_vertical",
		},
	},
})
