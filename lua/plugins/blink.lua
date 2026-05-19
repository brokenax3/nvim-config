local frienly_snippets = {
    -- "rafamadriz/friendly-snippets",
    "ruslanSorokin/friendly-snippets",
    branch = "fix/do-not-include-global-into-md-and-html",
}

---@module "lazy"
---@type LazySpec
return {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
        "saghen/blink.lib",
        -- optional: provides snippets for the snippet source
        { friendly_snippets },
        "mikavilpas/blink-ripgrep.nvim",
    },
    build = function()
        -- build the fuzzy matcher, wait up to 60 seconds
        -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
        require("blink.cmp").build():wait(60000)
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- (Default) list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "ripgrep",
            },
            providers = {
                -- 👇🏻👇🏻 add the ripgrep provider config below
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    -- see the full configuration below for all available options
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {},
                },
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"`
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "rust" },
        cmdline = {
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } },
        },
    },
}
