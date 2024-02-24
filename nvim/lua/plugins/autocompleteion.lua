return {
	"hrsh7th/cmp-path", -- autocompleteion source for file system paths
	"saadparwaiz1/cmp_luasnip", -- connect autocompletion and snippet plugins
	"rafamadriz/friendly-snippets",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "L3MON4D3/LuaSnip", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip/loaders/from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-l>"] = cmp.mapping.select_prev_item(),
					["<C-k>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority_weight = 100 },
					{ name = "luasnip" },
					{ name = "path" },
				}),
				sorting = {
					comparators = {
						cmp.config.compare.locality, -- words closer to the cursor
						cmp.config.compare.scopes, -- words in the scopes closer to the current
						cmp.config.compare.offset,
						cmp.config.compare.sort_text,
						cmp.config.compare.recently_used,
						cmp.config.compare.score,
						cmp.config.compare.order,
						cmp.config.compare.kind,
						cmp.config.compare.length,
						cmp.config.compare.exact,
					},
				},
				-- below is some custom stuff from cmp issues to prevent popup from jumping
				formatting = {
					format = function(entry, vim_item)
						local ELLIPSIS_CHAR = "…"
						local MAX_LABEL_WIDTH = 20
						local MIN_LABEL_WIDTH = 20
						local label = vim_item.abbr
						local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
						if truncated_label ~= label then
							vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
						elseif string.len(label) < MIN_LABEL_WIDTH then
							local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
							vim_item.abbr = label .. padding
						end
						return vim_item
					end,
				},
			})
		end,
	},
}
