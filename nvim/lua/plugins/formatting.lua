local js_formatters = {
	"prettier",
	"eslint_d",
}

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = js_formatters,
				javascriptreact = js_formatters,
				typescript = js_formatters,
				typescriptreact = js_formatters,
				svelte = { "prettier" },
				css = { "prettier", "stylelint" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 3000,
			},
		})
	end,
}
