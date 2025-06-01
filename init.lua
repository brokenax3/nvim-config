------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable deprecation warning
vim.deprecate = function() end

require("options")
require("lazy_options")
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
vim.o.background = "dark"

-- Spell Check in Markdown File
-- vim.api.nvim_command([[autocmd FileType markdown setlocal spell]])

-- Suda VIM
vim.g["suda#prompt"] = "Magic Words: "
vim.g.suda_smart_edit = 1

-- Set Environment Variables for Ripgrep
vim.fn.setenv("RIPGREP_CONFIG_PATH", "/Users/markle/.ripgreprc")


vim.cmd("colorscheme citruszest")

-- vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
--     callback = function(args)
--         if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
--
--

-- Autocommands for FOCUS
local ignore_filetypes = { 'neo-tree', 'trouble' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

local augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
        else
            vim.b.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for FileType',
})
