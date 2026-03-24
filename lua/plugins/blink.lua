local frienly_snippets = {
  -- "rafamadriz/friendly-snippets",
  "ruslanSorokin/friendly-snippets",
  branch = "fix/do-not-include-global-into-md-and-html",
}

return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    { frienly_snippets },
  },
  opts = {
    snippets = { preset = "luasnip" },
    -- ensure you have the `snippets` source (enabled by default)
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
