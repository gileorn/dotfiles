-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

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
			"package%-lock.json",
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
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
telescope.load_extension("notify")
