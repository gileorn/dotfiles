local keymap = vim.keymap
local luasnip = require("luasnip")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

local search_by_word = function()
	local conf = require("telescope.config").values
	require("telescope.builtin").live_grep({
		vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
	})
end

vim.g.tmux_navigator_no_mappings = 1 -- disable default tmux navigator keymaps

------------------------
-- GENERAL KEYMAPS
------------------------
keymap.set("n", "<leader>%", ":luafile %<CR>", { desc = "Reload Lua Config" })
keymap.set("n", "x", '"_x') -- do not copy to register the symbol that are deleted with x
keymap.set({ "n", "v" }, "c", '"_c') -- do not copy to register the target of change command

-- remap hjkl to jkl; for basic movement
keymap.set({ "n", "v" }, "j", "h", { noremap = true })
keymap.set({ "n", "v" }, "k", "j", { noremap = true })
keymap.set({ "n", "v" }, "l", "k", { noremap = true })
keymap.set({ "n", "v" }, ";", "l", { noremap = true })
keymap.set({ "n", "v" }, "gj", "gh", { noremap = true })
keymap.set({ "n", "v" }, "gk", "gj", { noremap = true })
keymap.set({ "n", "v" }, "gl", "gk", { noremap = true })
keymap.set({ "n", "v" }, "g;", "gl", { noremap = true })
keymap.set("n", "z;", "zl", { noremap = true })
keymap.set("n", "zj", "zh", { noremap = true })
keymap.set("n", "z:", "zL", { noremap = true })
keymap.set("n", "zJ", "zH", { noremap = true })

-- text wrap
keymap.set("n", "<leader>we", ":set wrap<CR>", { noremap = true, desc = "Enable Text Wrap", silent = true })
keymap.set("n", "<leader>wd", ":set nowrap<CR>", { noremap = true, desc = "Disable Text Wrap", silent = true })

-- change lines order
-- these symbols are Alt+k and Alt+l on Mac
keymap.set("n", "˚", ":m .+1<CR>", { noremap = true, silent = true })
keymap.set("n", "¬", ":m .-2<CR>", { noremap = true, silent = true })
keymap.set("v", "˚", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "¬", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical Split", silent = true })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Horizontal Split", silent = true })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal", silent = true })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split", silent = true })

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab", silent = true })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab", silent = true })
keymap.set("n", "<leader>tt", ":tabclose #<CR>", { desc = "Close Last Tab", silent = true })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next Tab", silent = true })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous Tab", silent = true })

-- copy file path
keymap.set("n", "<leader>cf", ':let @+ = expand("%:t")<cr>', { desc = "Copy Filename", silent = true })
keymap.set("n", "<leader>cP", ':let @+ = expand("%:p")<cr>', { desc = "Copy Absolute Path", silent = true })
keymap.set("n", "<leader>cp", ':let @+ = expand("%")<cr>', { desc = "Copy File Path from Content Root", silent = true })

-- rename
keymap.set("n", "<leader>cn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", silent = true })

-- show hover docs
keymap.set(
	"n",
	"<leader>ch",
	"<cmd>lua vim.lsp.buf.hover()<cr>",
	{ desc = "Show Hover Docs", noremap = true, silent = true }
)

-- show notifications and messages
keymap.set("n", "<leader>n", "<cmd>messages<cr>", { desc = "Show Notifications", noremap = true, silent = true })

------------------------
-- PLUGIN KEYMAPS
------------------------

-- lazy
keymap.set("n", "<leader>p", ":Lazy<CR>", { desc = "Open Lazy: Plugin management", silent = true })

-- mason
keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "Open Mason", silent = true })

-- zen-mode
keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode", silent = true })

-- vim-tmux-navigator
keymap.set("n", "<C-k>", ":<C-U>TmuxNavigateDown<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-l>", ":<C-U>TmuxNavigateUp<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-;>", ":<C-U>TmuxNavigateRight<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-j>", ":<C-U>TmuxNavigateLeft<cr>", { noremap = true, silent = true })

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle Split Maximization", silent = true })

-- treesj
keymap.set("n", "<leader>e", ":TSJToggle<CR>", { desc = "Expand/Collapse code block", silent = true })

-- nvim-tree
keymap.set("n", "<leader>k", function()
	require("nvim-tree.api").tree.toggle({ path = "<args>", find_file = false, update_root = false, focus = true })
end, { desc = "Toggle Explorer", silent = true })
keymap.set("n", "<leader>l", function()
	require("nvim-tree.api").tree.toggle({ path = "<args>", find_file = true, update_root = false, focus = true })
end, { desc = "Reveal current file in Explorer", silent = true })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files", silent = true })
keymap.set("n", "<leader>fs", search_by_word, { desc = "Text Search", silent = true })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep String", silent = true })
keymap.set(
	"n",
	"<leader>fd",
	"<cmd>Telescope live_grep search_dirs=.<cr>",
	{ desc = "Grep String In CWD", silent = true }
)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers", silent = true })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List Help Tags", silent = true })
keymap.set("n", "<leader>fc", "<cmd>Telescope git_status<cr>", { desc = "List Git Changes", silent = true })
keymap.set("n", "<leader>f?", "<cmd>Telescope commands<cr>", { desc = "Available Commands", silent = true })
keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix", silent = true })
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume the Last Search", silent = true })
keymap.set("n", "<leader>fp", "<cmd>Telescope pickers<cr>", { desc = "Pickers", silent = true })
keymap.set(
	"n",
	"<leader>fF",
	"<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
	{ desc = "Find Files including hidden", silent = true }
)

-- trouble
vim.keymap.set(
	"n",
	"<leader>cc",
	"<cmd>Trouble toggle<cr>",
	{ desc = "Toggle Trouble Plugin Visibility", silent = true }
)
vim.keymap.set("n", "<leader>ce", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Diagnostics", silent = true })
vim.keymap.set("n", "<leader>cq", "<cmd>Trouble qflist toggle<cr>", { desc = "Toggle Quickfix List", silent = true })
vim.keymap.set("n", "<leader>cr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "Show References", silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>Trouble lsp_definitions<cr>", { desc = "Show Definitions", silent = true })
vim.keymap.set("n", "<leader>cD", "<cmd>Trouble lsp_declarations<cr>", { desc = "Show Declarations", silent = true })

-- nvim-code-actions-menu
vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<cr>", { desc = "Code Actions", silent = true })

-- git blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle Git Blame", silent = true })
keymap.set("n", "<leader>ghf", ":GitBlameOpenFileURL<CR>", { desc = "Open File URL in Github", silent = true })
keymap.set("n", "<leader>ghc", ":GitBlameOpenCommitURL<CR>", { desc = "Open Commit URL in Github", silent = true })

-- diffview
keymap.set("n", "<leader>gc", ":DiffviewOpen<CR>", { desc = "View All Changes", silent = true })
keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", { desc = "View File History", silent = true })
keymap.set("n", "<leader>gr", ":DiffviewFileHistory<CR>", { desc = "View Full Repo History", silent = true })

-- spectre
keymap.set("n", "<leader>r", ":Spectre<CR>", { desc = "Global Find & Replace", silent = true })

-- harpoon
-- this was hl for Harpoon List and ha for Harpoon Add
-- but then I moved from hjkl to jkl; and muscle memory stuck
vim.keymap.set("n", "<leader>ja", harpoon_mark.add_file, { desc = "Add Harpoon Mark", silent = true })
vim.keymap.set("n", "<leader>j;", harpoon_ui.toggle_quick_menu, { desc = "See Harpoon Marks", silent = true })

-- luasnip
vim.keymap.set({ "i" }, "<C-K>", function()
	luasnip.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-n>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-b>", function()
	luasnip.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })

-- hlslens
vim.api.nvim_set_keymap(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>/",
	"<Cmd>noh<CR>",
	{ noremap = true, silent = true, desc = "Clear Search Highlight" }
)
