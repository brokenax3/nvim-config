-- vim.g.gruvbox_material_better_performance = 1

return {
  -- {
  --   "sainnhe/gruvbox-material",
  -- },
  {
    "RRethy/base16-nvim",
    config = function()
      require("matugen").setup()
    end,
  },

  -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox-material",
  --   },
  -- },
}
