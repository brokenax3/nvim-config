return {
    {
        "maxmx03/fluoromachine.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local fm = require("fluoromachine")
            local colors = require("fluoromachine.palette").get_colors()


            fm.setup({
                glow = true,
                theme = "fluoromachine",
                transparent = false,
                overrides = {
                    ["@markup.heading.1.markdown"] = { fg = colors.red },
                    ["@markup.heading.2.markdown"] = { fg = colors.pink },
                    ["@markup.heading.3.markdown"] = { fg = colors.yellow },
                    ["@markup.heading.4.markdown"] = { fg = colors.green },
                    ["@markup.heading.5.markdown"] = { fg = colors.orange },
                },
            })
        end,
    },
}
