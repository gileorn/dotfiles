-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
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
})

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- vim.treesitter.language.register("mdx", "markdown")
vim.treesitter.language.register("markdown", "mdx")
