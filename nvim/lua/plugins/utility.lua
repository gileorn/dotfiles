return {
	"szw/vim-maximizer",
	{ "folke/which-key.nvim", opts = {} },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" },
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			notify.setup({
				render = "compact",
				stages = "static",
				timeout = 1000,
			})

			-- vim.notify = notify

			local banned_messages = { "No information available" }

			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				notify(msg, ...)
			end
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				float_opts = { width = 1000, height = 1000 },
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			local gotop = Terminal:new({ cmd = "gotop", hidden = true, direction = "float" })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			function _gotop_toggle()
				gotop:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ desc = "Open lazygit", noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>a",
				"<cmd>lua _gotop_toggle()<CR>",
				{ desc = "Open gotop", noremap = true, silent = true }
			)
		end,
	},
	{
		"kylechui/nvim-surround",
		opts = {
			-- changed keymaps so that leap and surround plugins could happily live together
			-- see https://github.com/ggandor/leap.nvim/discussions/59
			keymaps = {
				normal = "gz",
				delete = "gzd",
				change = "gzr",
				-- insert = "<C-g>z",
				-- insert_line = "gC-ggZ",
				-- normal_cur = "gZ",
				-- normal_line = "gzgz",
				-- normal_cur_line = "gZgZ",
				visual = "gz",
				visual_line = "gz",
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		},
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		lazy = false,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {
			fastwarp = {
				enable = true,
				enable_normal = true,
				map = "<C-e>",
				cmap = "<C-e>",
			},
		},
	},

	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({ use_default_keymaps = false })
		end,
	},
}

-- reminder about surround:
-- to wrap a string with a set of parens we would use gziw(
-- - `gz` to trigger the surround plugin
-- - `iw` is vim motion to sellect inner word
-- - ( indicates the character to surround the word
-- to delete the surrounding pair of parens we would use `gzd(`
-- to change the surrounding pair of parens to brackets we would use `gzr([`
