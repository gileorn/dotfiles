-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
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
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	git = {
		ignore = false,
	},
})
