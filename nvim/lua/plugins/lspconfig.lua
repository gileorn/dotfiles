-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- set keybinds
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

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set(
			"n",
			"<leader>rf",
			":TypescriptRenameFile<CR>",
			{ noremap = true, silent = true, desc = "TS: Rename File" }
		) -- rename file and update imports
		keymap.set(
			"n",
			"<leader>co",
			":TypescriptOrganizeImports<CR>",
			{ noremap = true, silent = true, desc = "TS: Organize Imports" }
		) -- organize imports (not in youtube nvim video)
		keymap.set(
			"n",
			"<leader>cu",
			":TypescriptRemoveUnused<CR>",
			{ noremap = true, silent = true, desc = "TS: Remove Unused" }
		) -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
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

lspconfig.eslint.setup({
	capabilities = capabilities,
	flags = { debounce_text_changes = 500 },
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = true
		if client.resolved_capabilities.document_formatting then
			local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
				group = au_lsp,
			})
		end
	end,
})
--
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
--   command = 'silent! EslintFixAll',
--   group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
-- })
