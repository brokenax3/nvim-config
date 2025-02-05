return {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local colors = require("citruszest.palettes.colors")
        -- For using default config leave this empty.
        require("citruszest").setup({
            option = {
                transparent = false, -- Enable/Disable transparency
                bold = true,
                italic = true,
            },
            style = {
                markdownH1 = { fg = colors.red, bold = true },
                markdownH2 = { fg = colors.yellow, bold = true },
                markdownH3 = { fg = colors.blue, bold = true },
                markdownH4 = { fg = colors.orange, bold = true },
                markdownH5 = { fg = colors.green, bold = true },
            }
        })
    end,
}
