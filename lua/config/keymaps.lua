local map = vim.keymap.set

--INFO: Sensible Keymaps --

-- Remap ; to :
map("n", ";", ":")
-- Use Backspace to close buffers
map("n", "<Backspace>", [[<C-w>q]])
-- Escape Terminal
map("t", "<C-g>", "<C-\\><C-n>")

-- INFO: Snacks --
vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files({ ignored = true, hidden = true })
end, { desc = "Find Files (root dir)" })


vim.keymap.set("n", "<leader>mh", function()
  Snacks.picker.lines({
    pattern = "^#", -- Regex to match lines starting with a hash
  })
end, { desc = "Markdown Headers" })
