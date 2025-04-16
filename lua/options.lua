------------------------------------------------------------------------
--                         Vim Configuration                          --
------------------------------------------------------------------------
-- Better command-line completion
vim.o.wildmenu = true
-- Show partial commands in the last line of the screen
vim.o.showcmd = true
-- The encoding displayed
vim.o.encoding = "utf-8"
-- Makes popup menu smaller
vim.o.pumheight = 10
-- The encoding written to file
vim.o.fileencoding = "utf-8"
-- Show the cursor position all the time
vim.o.ruler = true
-- More space for displaying messages
vim.o.cmdheight = 2
-- Reasonable textwidth
-- vim.o.textwidth = 80
vim.o.numberwidth = 5
-- vim.o.columns = 85
-- treat dash separated words as a word text object"
vim.o.iskeyword = vim.o.iskeyword .. ",-,_"
-- Horizontal splits will automatically be below
vim.o.splitbelow = true
-- Vertical splits will automatically be to the right
vim.o.splitright = true
-- Let GUI window title to be the file name
vim.o.title = true

vim.opt.termguicolors = true
-- Always display the status line, even if only one window is displayed
vim.o.laststatus = 2
------------------------------------------------------------------------
--                             QOS Stuff                              --
------------------------------------------------------------------------
vim.o.grepprg = "rg --pretty --vimgrep --smart-case --follow"
-- Enables syntax highlighing
-- vim.o.syntax = 'ON'
-- Required to keep multiple buffers open multiple buffers
vim.o.hidden = true
vim.o.spell = false
-- vim.o.spellfile = '/home/mark/.config/nvim/spell/en.utf-8.add'
vim.o.spelllang = "en_us"
vim.o.spellsuggest = "best,9"
vim.o.conceallevel = 1
-- vim.o.textwidth=

-- Folding QOS
--
-- Maximum fold numbers
-- vim.o.foldnestmax = 0
-- set custom fold text to system
-- vim.o.foldmethod = "syntax"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Make vim highlight fenced code in markdown
-- vim.g.markdown_fenced_languages = { "python", "bash", "java", "fish" }
-- Disable markdown frontmatter syntax highlighing
-- vim.g.vim_markdown_frontmatter = 1
-- vim.g.markdown_folding = 1
-- vim.cmd([[au FileType markdown setlocal foldlevel=2]])
--Incremental live completion
vim.o.inccommand = "split"
-- Completion
vim.o.completeopt = "menu,menuone,noselect"

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.guifont = "DaddyTimeMono Nerd Font:h14"
------------------------------------------------------------------------
--                               Mouse                                --
------------------------------------------------------------------------
-- Enable your mouse
vim.o.mouse = "a"
vim.api.nvim_set_keymap("v", "<LeftRelease>", "\"*ygv", { silent = true })
------------------------------------------------------------------------
--                            Indentation                             --
------------------------------------------------------------------------
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
-- Makes tabbing smarter will realize you have 2 vs 4
vim.o.smarttab = true
-- Makes indenting smart
vim.o.smartindent = true
-- Good auto indent
vim.o.autoindent = true
--Enable break indent
vim.o.breakindent = true
vim.wo.wrap = true
vim.wo.linebreak = true
------------------------------------------------------------------------
--                            Line Number                             --
------------------------------------------------------------------------
-- Relative Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true
-- Cursor Line
vim.o.cursorline = true
------------------------------------------------------------------------
--                              Timeout                               --
------------------------------------------------------------------------
--
-- Faster completion
vim.o.updatetime = 300
vim.wo.signcolumn = "yes"
-- Quickly time out on keycodes, but never time out on mappings
vim.o.timeout = false
vim.o.ttimeoutlen = 200
-- Set Undo and Swap file
local datapath = vim.fn.stdpath("data")
vim.o.undodir = datapath .. "/undo/"
vim.o.backupdir = datapath .. "/backup/"
vim.o.directory = datapath .. "/swap/"
vim.o.undofile = true
vim.o.backup = true
------------------------------------------------------------------------
--                             Clipboard                              --
------------------------------------------------------------------------
-- Copy paste between vim and everything else
vim.api.nvim_set_option("clipboard", "unnamedplus")
