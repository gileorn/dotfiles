return {
	"pmizio/typescript-tools.nvim",
	config = function()
		local lspformat = require("lsp-format")

		require("typescript-tools").setup({
			on_attach = function(client, bufnr)
				lspformat.on_attach(client)

				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				-- vim.keymap.set(
				-- 	"n",
				-- 	"gD",
				-- 	"<Cmd>TSToolsGoToSourceDefinition<CR>",
				-- 	{ buffer = bufnr, desc = "Source Definition" }
				-- )

				vim.keymap.set(
					"n",
					"<leader>cI",
					"<Cmd>TSToolsAddMissingImports<CR>",
					{ buffer = bufnr, desc = "Add missing imports" }
				)
				vim.keymap.set(
					"n",
					"<leader>cO",
					"<Cmd>TSToolsOrganizeImports<CR>",
					{ buffer = bufnr, desc = "Organize imports" }
				)
				vim.keymap.set(
					"n",
					"<leader>cU",
					"<Cmd>TSToolsRemoveUnused<CR>",
					{ buffer = bufnr, desc = "Remove unused variables" }
				)
				vim.keymap.set("n", "<leader>cF", "<Cmd>TSToolsFixAll<CR>", { buffer = bufnr, desc = "Fix all" })
			end,
			settings = {
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		})
	end,
}
