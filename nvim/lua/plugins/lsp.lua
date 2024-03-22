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
				"stylelint_lsp",
				"lua_ls",
				"emmet_ls",
				"svelte",
			},
			automatic_installation = true, -- not the same as ensure_installed
		},
	},
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
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"help",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"go",
				"svelte",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
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

			lspconfig["svelte"].setup({
				capabilities = capabilities,
				-- on_attach = on_attach,
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["stylelint_lsp"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "css", "sass", "scss", "less" },
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
