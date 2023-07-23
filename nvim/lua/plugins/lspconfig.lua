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

local keymap = vim.keymap

local on_attach = function(client, bufnr)
	keymap.set(
		"n",
		"<leader>ci",
		"<cmd>Lspsaga finder<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Show Definition & References" }
	)
	keymap.set(
		"n",
		"<leader>cd",
		"<cmd>Lspsaga peek_definition<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Peek Definition" }
	)
	keymap.set(
		"n",
		"<leader>cD",
		"<Cmd>lua vim.lsp.buf.declaration()<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go To Declaration" }
	)
	keymap.set(
		"n",
		"<leader>cI",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go To Implementation" }
	)
	keymap.set(
		"n",
		"<leader>ca",
		"<cmd>Lspsaga code_action<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Code Actions" }
	)
	keymap.set(
		"n",
		"<leader>cr",
		"<cmd>Lspsaga rename<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Rename" }
	)
	keymap.set(
		"n",
		"<leader>ch",
		"<cmd>Lspsaga hover_doc<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Show Hover Documentation" }
	)
	keymap.set(
		"n",
		"<leader>co",
		"<cmd>Lspsaga outline<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Toggle Outline" }
	)
	keymap.set(
		"n",
		"<leader>el",
		"<cmd>Lspsaga show_line_diagnostics<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Show Line Diagnostics" }
	)
	keymap.set(
		"n",
		"<leader>ec",
		"<cmd>Lspsaga show_cursor_diagnostics<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Show Cursor Diagnostics" }
	)
	keymap.set(
		"n",
		"<leader>eb",
		"<cmd>Lspsaga diagnostic_jump_prev<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go To Previous Error" }
	)
	keymap.set(
		"n",
		"<leader>en",
		"<cmd>Lspsaga diagnostic_jump_next<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go To Next Error" }
	)

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

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

lspconfig.eslint.setup({
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
