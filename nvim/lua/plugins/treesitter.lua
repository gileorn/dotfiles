return {
	"nvim-treesitter/nvim-treesitter",
	init = function()
		vim.treesitter.language.register("markdown", "mdx")
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
}
