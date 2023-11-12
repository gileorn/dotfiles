return {
	"nvim-lua/plenary.nvim", -- required for many plugins as a dependency

	-- ===================================
	-- colorschemes
	-- ===================================
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = { flavour = "mocha" },
	},

	-- ===================================
	-- git
	-- ===================================
	"lewis6991/gitsigns.nvim",
	"f-person/git-blame.nvim",
	"sindrets/diffview.nvim",

	-- ===================================
	-- navigation
	-- ===================================
	"ggandor/leap.nvim",
	"mg979/vim-visual-multi",
	"ThePrimeagen/harpoon",
	"nvim-tree/nvim-tree.lua",
	"petertriho/nvim-scrollbar",
	"christoomey/vim-tmux-navigator",

	-- ===================================
	-- UI
	-- ===================================
	"nvim-lualine/lualine.nvim",
	"kyazdani42/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	"folke/zen-mode.nvim",
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	-- ===================================
	-- utility
	-- ===================================
	{ "folke/which-key.nvim", opts = {} },
	"rcarriga/nvim-notify",
	"szw/vim-maximizer",
	"kylechui/nvim-surround",
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" },
	{ "akinsho/toggleterm.nvim", version = "*" },
	"numToStr/Comment.nvim",
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

	-- ===================================
	-- search
	-- ===================================
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", version = "0.1.x" },
	"nvim-pack/nvim-spectre",
	"kevinhwang91/nvim-hlslens",

	-- ===================================
	-- autocompletion & snippets
	-- ===================================
	"hrsh7th/nvim-cmp", -- autocompletion plugin
	"hrsh7th/cmp-path", -- autocompleteion source for file system paths
	"saadparwaiz1/cmp_luasnip", -- connect autocompletion and snippet plugins
	"rafamadriz/friendly-snippets",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},

	-- ===================================
	-- lsp
	-- ===================================
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
	"jose-elias-alvarez/null-ls.nvim",
	{
		"jayp0521/mason-null-ls.nvim",
		dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
		opts = {
			ensure_installed = {
				"prettierd",
				"stylua",
				"eslint_d",
			},
			automatic_installation = true,
		},
	},
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"folke/trouble.nvim",
	"lewis6991/hover.nvim",
	"weilbith/nvim-code-action-menu",
	"lukas-reineke/lsp-format.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			})
		end,
	},
}
