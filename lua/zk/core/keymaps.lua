vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps 
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- delete hightLight of the screne

keymap.set("n", "x", '"_x') -- When deleting a caractere do not copy it

-- commands for split window
-- TODO: Add the possibility to change split window size
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- commands for tabs 
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>x", ":tabclose<CR>") -- close current tab TODO: Change en autre chose de meilleur 
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab TODO: Changer en juste tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previouse tab

-- vim-maximizer 
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
