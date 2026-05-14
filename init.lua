-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.filetype")
-- require("config.keymaps")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./custom-snippets" } })

require("matugen").setup()
vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})
