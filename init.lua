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

vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")

-- Treesitter and Large Files
-- local function augroup(name)
--   return vim.api.nvim_create_augroup(name, { clear = true })
-- end
--
-- vim.filetype.add({
--   pattern = {
--     [".*"] = {
--       function(path, buf)
--         return vim.bo[buf].filetype ~= "bigfile" and path and vim.fn.getfsize(path) > vim.g.bigfile_size and "bigfile"
--           or nil
--       end,
--     },
--   },
-- })
--
-- vim.api.nvim_create_autocmd({ "Filetype" }, {
--   group = augroup("bigfile"),
--   pattern = "bigfile",
--   callback = function(ev)
--     vim.b.minianimate_disable = true
--     vim.schedule(function()
--       vim.bo[ev.buf].syntax = vim.filetype.match({ buf = ev.buf }) or ""
--     end)
--   end,
-- })

-- local big_file_nuke_group = vim.api.nvim_create_augroup("big-file-nuke", { clear = true })
-- local huge_file = ""
-- vim.api.nvim_create_autocmd("BufReadPre", {
--     pattern = "*",
--     group = big_file_nuke_group,
--     callback = function()
--         local relevant_file = vim.fn.expand("<afile>")
--         local ok, stats = pcall(vim.uv.fs_stat, vim.fn.expand(relevant_file))
--         if not ok then return end
--         local ok, linecount = pcall(vim.fn.system, "< " .. vim.fn.expand(relevant_file) .. "head -1000 | wc -l")
--         if not ok then linecount = "1000" end
--         local just_big = (stats.size > 1024 * 1024 * 2)
--         local big_however = (stats.size > 1024 * 1024 * 0.5)
--         local just_a_few_lines = tonumber(linecount:match("%d+")) < 3
--         if just_big or (big_however and just_a_few_lines) then
--             vim.notify("File: " .. relevant_file .. " is greater than 2MB.  Shutting off file detection ")
--             huge_file = relevant_file
--             vim.cmd.filetype("off")
--             vim.cmd.setlocal("noswapfile")
--             vim.cmd.setlocal("undolevels=0")
--             vim.cmd.setlocal("bufhidden=unload")
--         end
--     end,
-- })
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     pattern = "*",
--     group = big_file_nuke_group,
--     callback = function()
--         local relevant_file = vim.fn.expand("<afile>")
--         if relevant_file == huge_file then vim.cmd.filetype("on") end
--     end,
-- })
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "robot",
  callback = function()
    vim.bo.commentstring = "# %s"
  end
})
