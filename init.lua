-- init.lua --
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable deprecation warning
vim.deprecate = function() end

-- Do not load these files
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1

require("config.lazy")
require("config.options")
require("config.keybindings")
require("config.filetypes")
require("config.autocmds")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./custom-snippets" } })

-- Set Environment Variables for Ripgrep
vim.fn.setenv("RIPGREP_CONFIG_PATH", "/Users/markle/.ripgreprc")
vim.fn.setenv("DYLD_FALLBACK_LIBRARY_PATH", "/opt/homebrew/lib")
