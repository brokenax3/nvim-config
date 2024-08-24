------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy_options")
require("options")
require("custom_commands")
require("keybindings")

vim.api.nvim_command([[autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"]])

-- Do not load these files
local runtimep = vim.o.runtimepath
-- vim.o.runtimepath = runtimep:gsub(",/usr/share/vim/vimfiles", "")
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.o.background = ""

-- Spell Check in Markdown File
-- vim.api.nvim_command([[autocmd FileType markdown setlocal spell]])

-- Suda VIM
vim.g["suda#prompt"] = "Magic Words: "
vim.g.suda_smart_edit = 1

-- Set Environment Variables for Ripgrep
vim.fn.setenv("RIPGREP_CONFIG_PATH", "/Users/markle/.ripgreprc")

-- AutoCommands
-- Format files after writing
-- vim.api.nvim_exec(
--     [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.cpp,*.c,*.h,*.py,*.lua,*.js,*.xml,*.yaml FormatWrite
-- augroup END
-- ]],
--     true
-- )

vim.cmd("colorscheme citruszest")

-- vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
--     callback = function(args)
--         if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
