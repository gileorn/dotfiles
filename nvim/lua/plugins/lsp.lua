return {
	"weilbith/nvim-code-action-menu",
	{
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
	},
	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					require("hover.providers.lsp")
				end,
				preview_opts = {
					border = nil,
				},
				preview_window = false,
				title = true,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	}, -- in charge of managing lsp servers, linters & formatters
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
			},
			automatic_installation = true, -- not the same as ensure_installed
		},
	}, -- bridges gap b/w mason & lspconfig
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	config = function()
	-- 		local lspformat = require("lsp-format")
	--
	-- 		require("typescript-tools").setup({
	-- 			on_attach = function(client, bufnr)
	-- 				lspformat.on_attach(client)
	--
	-- 				client.server_capabilities.documentFormattingProvider = false
	-- 				client.server_capabilities.documentRangeFormattingProvider = false
	--
	-- 				-- vim.keymap.set(
	-- 				-- 	"n",
	-- 				-- 	"gD",
	-- 				-- 	"<Cmd>TSToolsGoToSourceDefinition<CR>",
	-- 				-- 	{ buffer = bufnr, desc = "Source Definition" }
	-- 				-- )
	--
	-- 				vim.keymap.set(
	-- 					"n",
	-- 					"<leader>cI",
	-- 					"<Cmd>TSToolsAddMissingImports<CR>",
	-- 					{ buffer = bufnr, desc = "Add missing imports" }
	-- 				)
	-- 				vim.keymap.set(
	-- 					"n",
	-- 					"<leader>cO",
	-- 					"<Cmd>TSToolsOrganizeImports<CR>",
	-- 					{ buffer = bufnr, desc = "Organize imports" }
	-- 				)
	-- 				vim.keymap.set(
	-- 					"n",
	-- 					"<leader>cU",
	-- 					"<Cmd>TSToolsRemoveUnused<CR>",
	-- 					{ buffer = bufnr, desc = "Remove unused variables" }
	-- 				)
	-- 				vim.keymap.set("n", "<leader>cF", "<Cmd>TSToolsFixAll<CR>", { buffer = bufnr, desc = "Fix all" })
	-- 			end,
	-- 			settings = {
	-- 				tsserver_file_preferences = {
	-- 					includeInlayParameterNameHints = "all",
	-- 					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	-- 					includeInlayFunctionParameterTypeHints = true,
	-- 					includeInlayVariableTypeHints = true,
	-- 					includeInlayPropertyDeclarationTypeHints = true,
	-- 					includeInlayFunctionLikeReturnTypeHints = true,
	-- 					includeInlayEnumMemberValueHints = true,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			vim.treesitter.language.register("markdown", "mdx")
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		opts = {
			highlight = {
				enable = true,
			},
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true, enable_close_on_slash = false },
			context_commentstring = {
				enable = true,
			},
			-- ensure these language parsers are installed
			auto_install = true,
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"go",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		init = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local on_attach = function() end

			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["tsserver"].setup({
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

			lspconfig["mdx_analyzer"].setup({})

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
		end,
	},
}
