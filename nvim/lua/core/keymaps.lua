vim.g.mapleader = " "

local keymap = vim.keymap

------------------------
-- GENERAL KEYMAPS
------------------------
keymap.set("n", "<leader>%", ":luafile %<CR>", { desc = "Reload Lua Config" })
keymap.set("n", "x", '"_x') -- do not copy to register the symbol that are deleted with x

-- change lines order
-- these symbols are Alt+j and Alt+k on Mac
keymap.set("n", "∆", ":m .+1<CR>")
keymap.set("n", "˚", ":m .-2<CR>")
keymap.set("v", "∆", ":m '>+1<CR>gv=gv", { noremap = true })
keymap.set("v", "˚", ":m '<-2<CR>gv=gv", { noremap = true })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Create Vertical Split" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Create Horizontal Split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split" })

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go To Next Tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go To Previous Tab" })

-- copy file path
keymap.set("n", "<leader>cf", ':let @+ = expand("%:t")<cr>', { desc = "Copy Filename" })
keymap.set("n", "<leader>cp", ':let @+ = expand("%")<cr>', { desc = "Copy File Path from Content Root" })
keymap.set("n", "<leader>cP", ':let @+ = expand("%:p")<cr>', { desc = "Copy Absolute Path" })

------------------------
-- PLUGIN KEYMAPS
------------------------

-- packer
keymap.set("n", "<leader>ps", ":PackerStatus<CR>", { desc = "Status | List All Plugins" })
keymap.set("n", "<leader>pu", ":PackerUpdate<CR>", { desc = "Update All Plugins" })
keymap.set("n", "<leader>pi", ":PackerInstall<CR>", { desc = "Install All Plugins" })

-- mason
keymap.set("n", "<leader>m", ":Mason<CR>") -- toggle split window maximization

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>j", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
keymap.set("n", "<leader>k", ":NvimTreeFindFile<CR>", { desc = "Reveal current file in Explorer" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files including hidden" })
keymap.set("n", "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find Files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Grep String" })
keymap.set(
	"n",
	"<leader>fd",
	"<cmd>Telescope current_buffer_fuzzy_find fuzzy=false<cr>",
	{ desc = "Search String in Current Buffer" }
)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List Help Tags" })
keymap.set("n", "<leader>fc", "<cmd>Telescope git_status<cr>", { desc = "List Git Changes" })
keymap.set("n", "<leader>fr", "<cmd>Telescope commands<cr>", { desc = "Available Commands" })
keymap.set("n", "<leader>fa", "<cmd>Telescope colorscheme<cr>", { desc = "Colorschemes" })
keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })
keymap.set("n", "<leader>fl", "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume the Last Search" })
keymap.set("n", "<leader>fp", "<cmd>Telescope pickers<cr>", { desc = "Pickers" })

-- git blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle Git Blame" })
keymap.set("n", "<leader>gu", ":GitBlameOpenCommitURL<CR>", { desc = "Open Commit URL" })
