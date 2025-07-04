return {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    opts = {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(rt_colors) -- add/modify highlights
            colors = rt_colors.palette
            return {
                -- Markdown
                ["@markup.heading"] = { link = "" },
                ["@markup.heading.1.markdown"] = { fg = colors.peachRed, bold = true },
                ["@markup.heading.2.markdown"] = { fg = colors.lotusOrange, bold = true },
                ["@markup.heading.3.markdown"] = { fg = colors.carpYellow, bold = true },
                ["@markup.heading.4.markdown"] = { fg = colors.springGreen, bold = true },
                ["@markup.heading.5.markdown"] = { fg = colors.oniViolet, bold = true },

                -- which-key
                -- WhichKey = { bg = colors.dragonBlack5 },
                WhichKeyBorder = { fg = colors.waveAqua2 },
                -- WhichKeyDesc = { bg = colors.dragonBlack5 },
                -- WhichKeyGroup = { bg = colors.dragonBlack5 },
                -- WhichKeyIcon = { fg = colors.text },
                -- WhichKeyIconAzure = { fg = colors.text },
                -- WhichKeyIconBlue = { fg = colors.text },
                -- WhichKeyIconCyan = { fg = colors.text },
                -- WhichKeyIconGreen = { fg = colors.text },
                -- WhichKeyIconGrey = { fg = colors.text },
                -- WhichKeyIconOrange = { fg = colors.text },
                -- WhichKeyIconPurple = { fg = colors.text },
                -- WhichKeyIconRed = { fg = colors.text },
                -- WhichKeyIconYellow = { fg = colors.text },
                WhichKeyNormal = { bg = colors.dragonBlack4 },
                -- WhichKeySeparator = { fg = colors.text },
                -- WhichKeyTitle = { fg = colors.text },
                -- WhichKeyValue = { fg = colors.text },
            }
        end,
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
    },
}
