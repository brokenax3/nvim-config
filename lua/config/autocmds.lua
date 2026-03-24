local zk = require("zk")
local commands = require("zk.commands")
local notes_dir = "/Users/markle/git/mark-brain"

commands.add("ZkDaily", function()
  commands.get("ZkNew")({ dir = notes_dir .. "/02-journal" })
end)

commands.add("ZkInbox", function(options)
  options = vim.tbl_extend("force", { orphan = true }, options or {})
  commands.get("ZkNew")(options, { dir = notes_dir .. "/01-inbox" })
end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gotmpl" }, -- File types to exclude
  callback = function()
    vim.lsp.stop_client(vim.lsp.buf_get_clients(), true)
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Make Folding Better for Markdown",
  pattern = { "markdown" },
  callback = function()
    -- Set fold method to "syntax" (or "expr" if using treesitter/plugins)
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- Set fold level to 1 to start with all top-level headers folded
    vim.opt_local.foldlevel = 2
    -- You may also want to set g:markdown_folding = 1 for the default runtime folding to work well
    vim.g.markdown_folding = 1
  end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "Enable todo-comments for text",
--   group = vim.api.nvim_create_augroup("user.todo.text", { clear = true }),
--   callback = function(ev)
--     local config = require("todo-comments.config")
--     local comments_only = string.match(ev.file, "%.md$") == nil
--       and string.match(ev.file, "%.txt$") == nil
--       and string.match(ev.file, "%.adoc$") == nil
--       and string.match(ev.file, "%.asciidoc$") == nil
--     config.options.highlight.comments_only = comments_only
--   end,
-- })
