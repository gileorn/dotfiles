return {
	"folke/trouble.nvim",
	opts = {
		use_diagnostic_signs = true,
		mode = "lsp_references",
		position = "bottom",
		auto_close = true,
		height = 20,
		action_keys = {
			previous = "l",
			next = "k",
		},
		auto_jump = { "lsp_references", "lsp_implementations", "lsp_definitions", "lsp_type_definitions" },
		include_declaration = { "lsp_definitions" },
	},
}
