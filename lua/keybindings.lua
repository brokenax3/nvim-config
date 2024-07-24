-- Leader Key
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- ---------------------- --
-- Functionality mappings --
-- ---------------------- --
--  List open buffers
local telescope_buffers = [[<Cmd>lua require("telescope.builtin").buffers()<CR>]]

-- Telescope opts
local opt_telescope_find_files = [[<Cmd>lua require("telescope.builtin").find_files(]]
local opt_telescope = [[<Cmd>lua require("telescope.builtin").find_files(]]
local opt_ivy = [[require("telescope.themes").get_ivy({shorten_path = false, layout_config = { height = 20 }, ]]
local terminate_opt = [[}))<cr>]]

-- Search in the current working directory
local f_files_in_opts = [[hidden = false, follow = true, find_command = { "rg", "--files", "-uuu" }]]
local f_files_in = opt_telescope_find_files .. opt_ivy .. [[ cwd = ".", ]] .. f_files_in_opts .. terminate_opt

-- Search the whole system
local f_all_opts = [[follow = true, hidden = true, find_command = { "rg", "--files", "--type", "all" ,"-uuu"}]]
local f_all = opt_telescope_find_files .. opt_ivy .. [[ cwd = "~", ]] .. f_all_opts .. terminate_opt
-- Wiki Search (Find in Note Directory)
local f_wiki_opts = [[follow = true, hidden = true, find_command = { "rg", "--files", "--type", "markdown", "--type", "tex" }]]
local f_wiki = opt_telescope_find_files .. opt_ivy .. [[ cwd = "~/git/mark-brain", ]] .. f_wiki_opts .. terminate_opt

--  List open buffers
map("n", "<leader>e", telescope_buffers, { silent = true })
-- Find in files
map("n", "<leader>ff", f_files_in, { silent = true })
map("n", "<leader>fa", f_all, { silent = true })
map("n", "<leader>fna", f_wiki, { silent = true })

-- require("telescope.builtin").find_files({cwd = ".", hidden = false, follow = true, find_command = { "rg", "--files" })
-- Telescope Shorcuts
--
-- Search in Register
map("n", "<leader>fr", [[<Cmd>lua require("telescope.builtin").registers(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Live Grep
map("n", "<leader>fg", [[<Cmd>lua require("telescope.builtin").live_grep(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Search the search history
map("n", "<leader>fh", [[<Cmd>lua require("telescope.builtin").search_history(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Search within the buffer
map("n", "<leader>fi", [[<Cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Search Commands
map("n", "<leader>fc", [[<Cmd>lua require("telescope.builtin").commands(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Search Keymaps
map("n", "<leader>fk", [[<Cmd>lua require("telescope.builtin").keymaps(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Search Directories
map("n", "<leader>fd", [[<Cmd>lua require("telescope").extensions.zoxide.list({]] .. opt_ivy .. [[})})<CR>]], { silent = true })
-- Projects.nvim
map("n", "<leader>fp", [[<Cmd>lua require('telescope').extensions.projects.projects(]] .. opt_ivy .. terminate_opt, { silent = true })
-- Telescope Selection
map("n", "<leader>tl", [[<Cmd>lua require("telescope.builtin").builtin(]] .. opt_ivy .. [[, include_extensions = true}))<CR>]], { silent = true })
-- Markdown Headings in Quickfix
map("n", "<leader>ml", [[<Cmd>lua require("telescope").extensions.heading.heading(]] .. opt_ivy .. [[, include_extensions = true}))<CR>]], { silent = true })

-- ---------------- --
-- General mappings --
-- ---------------- --
-- Better copy
map("n", "Y", "y$")

-- Better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Clear highlighting
map("n", "<C-l>", "<cmd>nohl<CR>")

-- Spelling Correction
-- Correct previous spelling error
map("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
map("n", "<leader>ss", "<cmd>set spell!<CR>")
map("n", "z=", [[<Cmd>lua require('telescope.builtin').spell_suggest(]] .. opt_telescope .. terminate_opt, { silent = true })

-- Correct Capitalisation
map("i", "<C-k>", "<c-g>u<Esc>b~ea<c-g>u")

-- Remap ; to :
map("n", ";", ":")

-- Quickfix List
map("n", "<leader>c", ":cclose<CR>")

-- Terminal Escaping
map("t", "<C-g>", "<C-\\><C-n>")

-- Jumplist
map("n", "<C-o>", "<C-o>")
map("n", "<C-i>", "<C-i>")
-- map("n", "<Tab>", "<C-i>")

-- Markdown Preview
map("n", "<F8>", "<cmd>MarkdownPreview<CR>")

-- LSP Keybindings
map("n", "<localleader>n", [[<Cmd>lua vim.diagnostic.goto_next()<CR>]])
map("n", "<localleader>N", [[<Cmd>lua vim.diagnostic.goto_prev()<CR>]])
map("n", "<localleader>a", [[<Cmd>lua vim.lsp.buf.code_action()<CR>]])
map("n", "<localleader>d", [[<Cmd>lua vim.lsp.buf.definition()<CR>]])

-- ------------------ --
-- Neovim Keybindings --
-- ------------------ --
-- Source keybindings
map("n", "<F5>", "<Cmd>source ~/.config/nvim/lua/keybindings.lua<CR>")
map("n", "<F2>", "<Cmd>lua print('Test')<CR>")

-- Clipboard
map("n", "<leader>p", [[<Cmd>Telescope neoclip<CR>]])

-- Remove all blank lines
map("v", "<leader>b", [[<Cmd>'<,'>g/^$/d<CR><CMD>nohl<CR>]])

-- Delete current file and close buffer
map("n", "<leader>df", [[<Cmd>call delete(expand('%')) | bdelete!<CR>]])

-- Scratchpad Shortcuts
map("n", "<leader>cc", "<Cmd>e /Users/markle/.scratchpad.md<CR>")

-- Context Treesitter
map("n", "[c", "m'|<Cmd>lua require('treesitter-context').go_to_context()<CR>")

-- Folding
-- map("n", "zR", [[<Cmd>lua require("ufo").openAllFolds<CR>]])
-- map("n", "zM", [[<Cmd>lua require("ufo").closeAllFolds<CR>]])

-- Quickly rename terminals
--[[ map("n", "<leader>r", "<Cmd>keepalt file" .. vim.fn.input("Terminal Name :") .. "<CR>") ]]

-- map("n", "<leader>jl", "<Cmd>lua set_jenkins_env()<CR>")
