-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	-- options = {
	-- icons_enabled = false,
	-- component_separators = "|",
	-- section_separators = "",
	-- },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "filetype" },
		lualine_y = {},
		lualine_z = { "location" },
	},
	options = {
		disabled_filetypes = { statusline = { "packer", "NvimTree", "sagafinder" } },
	},
})
