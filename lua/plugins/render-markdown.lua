return {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        heading = {
            border = true,
            position = "inline",
            icons = { "# ", "## ", "### ", "#### ", "##### " },
        },
        -- indent = { enabled = true },
        code = {
            style = "full",
            conceal_delimiters = false,
            border = "thick"
        },
    },
}
