return {
    "echasnovski/mini.map",
    version = false,
    opts = {
        -- Symbols used to display data
        symbols = {
            -- Scrollbar parts for view and line. Use empty string to disable any.
            scroll_line = "█",
            scroll_view = "┃",
        },
        -- Window options
        window = {
            -- Whether window is focusable in normal way (with `wincmd` or mouse)
            focusable = true,
            -- Side to stick ('left' or 'right')
            side = "right",
            -- Whether to show count of multiple integration highlights
            show_integration_count = true,
            -- Total width
            width = 10,
            -- Value of 'winblend' option
            winblend = 25,
            -- Z-index
            zindex = 10,
        },
    },
    config = function(_, opts)
        local gen_integration = require("mini.map").gen_integration

        opts.symbols.encode = require("mini.map").gen_encode_symbols.dot("4x2")

        opts.integrations = {
            gen_integration.builtin_search(),
            gen_integration.diagnostic(),
            gen_integration.gitsigns(),
        }

        -- Finally, call setup with the fully configured options
        require("mini.map").setup(opts)
    end,
}
