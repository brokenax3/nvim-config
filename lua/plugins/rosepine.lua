return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        local colors = require("rose-pine.palette")
        require("rose-pine").setup({
            variant = "main",
            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },
            highlight_groups = {
                markdownH1 = { fg = colors.gold, bold = true },
                markdownH2 = { fg = colors.love, bold = true },
                markdownH3 = { fg = colors.iris, bold = true },
                markdownH4 = { fg = colors.pine, bold = true },
                markdownH5 = { fg = colors.rose, bold = true },
            }
        })
    end,
}
