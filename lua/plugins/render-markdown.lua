return {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        enabled = false,
        heading = {
            border = true,
            position = "inline",
            icons = { "# ", "## ", "### ", "#### ", "##### " },
        },
        -- indent = { enabled = true },
        code = {
            style = "full",
            conceal_delimiters = false,
            border = "thick",
        },
        link = { enabled = false },
    },
    keys = {
        { "<leader>mr", function() require("render-markdown").toggle() end, desc = "Render Markdown Toggle" },
    },
}
