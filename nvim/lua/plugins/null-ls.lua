return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local formatting = require("null-ls").builtins.formatting

		require("null-ls").setup({
			sources = {
				formatting.stylua,
				formatting.prettierd.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"markdown",
						"markdown.mdx",
						"mdx",
					},
					generator_opts = {
						command = "prettierd",
						args = { "$FILENAME" },
						to_stdin = true,
						condition = function(utils)
							return utils.root_has_file("package.json")
								or utils.root_has_file(".prettierrc")
								or utils.root_has_file(".prettierrc.json")
								or utils.root_has_file(".prettierrc.js")
						end,
					},
				}),
			},

			-- configure format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
