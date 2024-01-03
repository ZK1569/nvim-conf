vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps 
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>e", ":Ex<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- delete hightLight of the screne

keymap.set("n", "x", '"_x') -- When deleting a caractere do not copy it

-- telescope 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
