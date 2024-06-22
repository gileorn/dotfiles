local js_formatters = {
	"prettierd",
	-- eslint should be here, but it is slow as hell on bigger projects
}

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = js_formatters,
				javascriptreact = js_formatters,
				typescript = js_formatters,
				typescriptreact = js_formatters,
				svelte = { "prettierd" },
				css = { "prettierd", "stylelint" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			},
		})

		-- eslint (even deamon) is so slow that it should be
		-- executed only when needed, not on every save
		vim.keymap.set("n", "<leader>q", function()
			conform.format({
				timeout = 8000,
				async = true,
				formatters = { "eslint_d" },
			})
		end, { desc = "Format file" })
	end,
}
