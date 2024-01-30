vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps 
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- delete hightLight of the screne

keymap.set("n", "x", '"_x') -- When deleting a caractere do not copy it
keymap.set("n", "U", ":redo<CR>") -- Redo 

-- commands for split window
-- TODO: Add the possibility to change split window size
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>w", ":bd<CR>")

-- vim-maximizer 

-- nvim-tree 
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Git fugitive
keymap.set("n", "<leader>gd", ":Git diff<CR>")
keymap.set("n", "<leader>gl", ":Git log --oneline<CR>")
keymap.set("n", "<leader>ga", ":Git add .<CR>")
keymap.set("n", "<leader>gc", ":Git commit -m ''<Left>", { noremap = true, silent = true })
keymap.set("n", "<leader>gp", ":Git push<CR>")
