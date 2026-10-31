local opt = vim.opt

-- INFO: Sensible Options
vim.api.nvim_set_option("clipboard", "unnamedplus")
opt.title = true
opt.wrap = true
opt.ignorecase = true
opt.smartcase = true
opt.scrollback = 100000

-- INFO: Line Numbers and Columns
opt.ruler = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1

-- INFO: Tabs and Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.linebreak = false

-- INFO: Conceal
opt.conceallevel = 0

-- INFO: Splits
opt.splitright = true
opt.splitbelow = true

-- INFO: Update and Timouts
opt.updatetime = 300
opt.timeout = false
opt.ttimeoutlen = 200

-- INFO: Undo, Swap and Backup
local datapath = vim.fn.stdpath("data")
opt.undodir = datapath .. "/undo/"
opt.backupdir = datapath .. "/backup/"
opt.directory = datapath .. "/swap/"
opt.undofile = true
opt.backup = true

-- INFO: Folding
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- INFO: Statusline
vim.opt.laststatus = 3

-- INFO: Splits
vim.opt.splitkeep = "screen"
