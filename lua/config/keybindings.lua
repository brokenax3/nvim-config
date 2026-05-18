local map = vim.keymap.set

-- Sensible Defaults --
-- Better copy
map("n", "Y", "y$")

-- Better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Clear highlighting
map("n", "<C-l>", "<cmd>nohl<CR>")

-- Jumplist
map("n", "<C-o>", "<C-o>")
map("n", "<C-i>", "<C-i>")

-- Terminal Escape
map("t", "<C-g>", "<C-\\><C-n>")

map('n', 'q:', '<nop>')
