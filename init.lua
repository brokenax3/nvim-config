------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable deprecation warning
vim.deprecate = function() end
-- Do not load these files
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1

require("options")
require("lazy_options")
require("custom_commands")
require("keybindings")

vim.api.nvim_command([[autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"]])

vim.o.background = "dark"

-- Spell Check in Markdown File
-- vim.api.nvim_command([[autocmd FileType markdown setlocal spell]])

-- Suda VIM
vim.g["suda#prompt"] = "Magic Words: "
vim.g.suda_smart_edit = 1

-- Set Environment Variables for Ripgrep
vim.fn.setenv("RIPGREP_CONFIG_PATH", "/Users/markle/.ripgreprc")
vim.fn.setenv("DYLD_FALLBACK_LIBRARY_PATH", "/opt/homebrew/lib")


vim.cmd("colorscheme kanagawa-dragon")

