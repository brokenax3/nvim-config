return {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "kkharji/sqlite.lua", module = "sqlite" },
    config = function()
        require("neoclip").setup({
            history = 1000,
            enable_persistent_history = true,
            length_limit = 1048576,
            continuous_sync = true,
            db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
            filter = nil,
            preview = true,
            default_register = "\"",
            default_register_macros = "q",
            enable_macro_history = true,
            content_spec_column = false,
            on_paste = {
                set_reg = false,
            },
            on_replay = {
                set_reg = false,
            },
            keys = {
                telescope = {
                    i = {
                        select = "<cr>",
                        paste = "<c-p>",
                        paste_behind = "<c-k>",
                        replay = "<c-q>", -- replay a macro
                        delete = "<c-d>", -- delete an entry
                        custom = {},
                    },
                    n = {
                        select = "<cr>",
                        paste = "p",
                        paste_behind = "P",
                        replay = "q",
                        delete = "d",
                        custom = {},
                    },
                },
            },
        })
    end,
}
