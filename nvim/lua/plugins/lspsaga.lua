-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	symbol_in_winbar = { enable = false },
	definition = {
		keys = {
			edit = "<CR>",
		},
	},
	finder = {
		layout = "normal",
		keys = {
			toggle_or_open = "<CR>",
		},
	},
	outline = {
		layout = "float",
	},
	lightbulb = {
		sign = false,
	},
	code_action = {
		extend_gitsigns = true,
		show_server_name = true,
	},
})
