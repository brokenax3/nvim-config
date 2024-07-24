return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function(_, opts)
        local colors = require("citruszest.palettes.colors")
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.violet })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
        end)
        vim.g.rainbow_delimiters = { highlight = highlight }
        -- Other blankline configuration here
        require("ibl").setup({
            indent = { highlight = highlight },
        })
    end,
    dependencies = {
        "TheGLander/indent-rainbowline.nvim",
    },
}
