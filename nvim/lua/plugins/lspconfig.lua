local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local lspformat_setup, lspformat = pcall(require, "lsp-format")
if not lspformat_setup then
	return
end

lspformat.setup()

local keymap = vim.keymap

local on_attach = function(client)
	lspformat.on_attach(client)

	if client.name == "tsserver" then
		keymap.set(
			"n",
			"<leader>rf",
			":TypescriptRenameFile<CR>",
			{ noremap = true, silent = true, desc = "TS: Rename File" }
		)
		keymap.set(
			"n",
			"<leader>co",
			":TypescriptOrganizeImports<CR>",
			{ noremap = true, silent = true, desc = "TS: Organize Imports" }
		)
		keymap.set(
			"n",
			"<leader>cu",
			":TypescriptRemoveUnused<CR>",
			{ noremap = true, silent = true, desc = "TS: Remove Unused" }
		)
	end
end

-- enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- disabling for now due to suggest trigger to anything in jsx
-- lspconfig["emmet_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })

lspconfig.eslint.setup({
	settings = {
		quiet = true,
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig["gopls"].setup({ on_attach = on_attach, capabilities = capabilities })
