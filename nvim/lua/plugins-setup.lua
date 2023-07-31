local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer itself
	use("nvim-lua/plenary.nvim") -- required for many plugins as a dependency

	-- ===================================
	-- colorschemes
	-- ===================================
	use("catppuccin/nvim")

	-- ===================================
	-- git
	-- ===================================
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")

	-- ===================================
	-- navigation
	-- ===================================
	use("ThePrimeagen/harpoon")
	use("ggandor/leap.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("christoomey/vim-tmux-navigator")
	use("petertriho/nvim-scrollbar")

	-- ===================================
	-- utility
	-- ===================================
	use("folke/which-key.nvim")
	use("windwp/nvim-autopairs")
	use("szw/vim-maximizer")
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use("lukas-reineke/indent-blankline.nvim")
	use("kylechui/nvim-surround")
	use("rcarriga/nvim-notify")

	-- ===================================
	-- search
	-- ===================================
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("kevinhwang91/nvim-hlslens")
	use("numToStr/Comment.nvim")

	-- ===================================
	-- autocompletion & snippets
	-- ===================================
	use("hrsh7th/nvim-cmp") -- autocompletion plugin
	use("hrsh7th/cmp-path") -- autocompleteion source for file system paths
	use("L3MON4D3/LuaSnip") -- snippet engine
	-- use "saadparwaiz1/cmp_luasnip" -- connect autocompletion and snippet plugins

	-- ===================================
	-- lsp
	-- ===================================
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("jose-elias-alvarez/typescript.nvim")
	use("folke/trouble.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- packer bootstrap
	-- should be after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
