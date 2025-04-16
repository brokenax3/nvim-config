return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function(_, opts)
        local colors = require("fluoromachine.palette").get_colors()
        local highlight = {
            "RainbowRed",
            "RainbowBlue",
            "RainbowYellow",
            "RainbowGreen",
            "RainbowOrange",
            "RainbowCyan",
            "RainbowViolet",
        }
        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.pink })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.purple })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup { indent = { highlight = highlight } }

        -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
    dependencies = {
        "TheGLander/indent-rainbowline.nvim",
    },
}
