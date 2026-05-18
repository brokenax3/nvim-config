return {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        overrides = function(colors)
            theme = colors.theme
            return {
                -- ["@markup.heading.1.markdown"] = { bg = theme.rainbow.rainbow1 },
                -- ["@markup.heading.2.markdown"] = { bg = theme.rainbow.rainbow2 },
                -- ["@markup.heading.3.markdown"] = { bg = theme.rainbow.rainbow3 },
                -- ["@markup.heading.4.markdown"] = { bg = theme.rainbow.rainbow4 },
                -- ["@markup.heading.5.markdown"] = { bg = theme.rainbow.rainbow5 },
            }
        end,
    },
    init = function() vim.cmd.colorscheme("kanagawa-paper-ink") end,
}
