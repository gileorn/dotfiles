return {
	"kylechui/nvim-surround",
	opts = {
		-- changed keymaps so that leap and surround plugins could happily live together
		-- see https://github.com/ggandor/leap.nvim/discussions/59
		keymaps = {
			normal = "gz",
			delete = "gzd",
			change = "gzr",
			-- insert = "<C-g>z",
			-- insert_line = "gC-ggZ",
			-- normal_cur = "gZ",
			-- normal_line = "gzgz",
			-- normal_cur_line = "gZgZ",
			visual = "gz",
			visual_line = "gz",
		},
	},
}

-- to wrap a string with a set of parens we would use gziw(
-- - `gz` to trigger the surround plugin
-- - `iw` is vim motion to sellect inner word
-- - ( indicates the character to surround the word
-- to delete the surrounding pair of parens we would use `gzd(`
-- to change the surrounding pair of parens to brackets we would use `gzr([`
