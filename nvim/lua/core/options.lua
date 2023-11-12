local opt = vim.opt

-- colorscheme
vim.cmd.colorscheme("catppuccin")

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark" -- keep dark settings for themes with both dark and light modes
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true

-- make count dashes as a part of a word
opt.iskeyword:append("-")

-- Enable mouse mode
vim.o.mouse = "a"

-- Which key
vim.o.timeout = true
vim.o.timeoutlen = 300

-- git blame
vim.g.gitblame_enabled = 0

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-cmp
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.pumheight = 7 -- number of suggestions in the popup
