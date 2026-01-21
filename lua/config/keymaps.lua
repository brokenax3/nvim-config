local map = vim.keymap.set

--INFO: Sensible Keymaps --

-- Remap ; to :
map("n", ";", ":")
-- Use Backspace to close buffers
map("n", "<Backspace>", [[<C-w>q]])
-- Escape Terminal
map("t", "<C-g>", "<C-\\><C-n>")
