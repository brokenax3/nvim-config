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
                rainbow1 = { fg = colors.bright_red },
                rainbow2 = { fg = colors.bright_yellow },
                rainbow3 = { fg = colors.bright_orange },
                rainbow4 = { fg = colors.bright_green },
                rainbow5 = { fg = colors.bright_blue },
                rainbow6 = { fg = colors.bright_black },
                -- markdownH1 = { link = "rainbow2", bold = true },
                -- markdownH2 = { fg = colors.red, bold = true },
                -- markdownH3 = { fg = colors.blue, bold = true },
                -- markdownH4 = { fg = colors.orange, bold = true },
                -- markdownH5 = { fg = colors.green, bold = true },
            }
        })
    end,
}
