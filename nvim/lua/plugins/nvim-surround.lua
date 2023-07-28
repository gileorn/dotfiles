require("nvim-surround").setup({
	-- see https://github.com/ggandor/leap.nvim/discussions/59
	keymaps = {
		-- insert = "<C-g>z",
		-- insert_line = "gC-ggZ",
		normal = "gz",
		normal_cur = "gZ",
		-- normal_line = "gzgz",
		-- normal_cur_line = "gZgZ",
		visual = "gz",
		visual_line = "gZ",
		delete = "gzd",
		change = "gzr",
	},
})
