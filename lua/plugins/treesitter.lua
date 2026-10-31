return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
        -- Select textobjects (visual + operator-pending)
        { "af", mode = { "x", "o" }, desc = "Textobj: outer function" },
        { "if", mode = { "x", "o" }, desc = "Textobj: inner function" },
        { "ac", mode = { "x", "o" }, desc = "Textobj: outer class" },
        { "ic", mode = { "x", "o" }, desc = "Textobj: inner class" },
        { "aa", mode = { "x", "o" }, desc = "Textobj: outer argument" },
        { "ia", mode = { "x", "o" }, desc = "Textobj: inner argument" },
        { "ab", mode = { "x", "o" }, desc = "Textobj: outer block" },
        { "ib", mode = { "x", "o" }, desc = "Textobj: inner block" },
        { "ai", mode = { "x", "o" }, desc = "Textobj: outer conditional" },
        { "ii", mode = { "x", "o" }, desc = "Textobj: inner conditional" },
        { "al", mode = { "x", "o" }, desc = "Textobj: outer loop" },
        { "il", mode = { "x", "o" }, desc = "Textobj: inner loop" },
        -- Move (normal mode)
        -- { "]f", desc = "Next function start" },
        -- { "]F", desc = "Next function end" },
        -- { "[f", desc = "Prev function start" },
        -- { "[F", desc = "Prev function end" },
        -- { "]c", desc = "Next class start" },
        -- { "]C", desc = "Next class end" },
        -- { "[c", desc = "Prev class start" },
        -- { "[C", desc = "Prev class end" },
        -- Swap (normal mode)
        { "<leader>sp", desc = "Swap with next parameter" },
        { "<leader>sP", desc = "Swap with prev parameter" },
    },
    opts = {
        indent = { enable = true },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        folds = { enable = true },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = { query = "@function.outer", desc = "outer function" },
                    ["if"] = { query = "@function.inner", desc = "inner function" },
                    ["ac"] = { query = "@class.outer", desc = "outer class" },
                    ["ic"] = { query = "@class.inner", desc = "inner class" },
                    ["aa"] = { query = "@parameter.outer", desc = "outer argument" },
                    ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
                    ["ab"] = { query = "@block.outer", desc = "outer block" },
                    ["ib"] = { query = "@block.inner", desc = "inner block" },
                    ["ai"] = { query = "@conditional.outer", desc = "outer conditional" },
                    ["ii"] = { query = "@conditional.inner", desc = "inner conditional" },
                    ["al"] = { query = "@loop.outer", desc = "outer loop" },
                    ["il"] = { query = "@loop.inner", desc = "inner loop" },
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]f"] = { query = "@function.outer", desc = "Next function start" },
                    ["]c"] = { query = "@class.outer", desc = "Next class start" },
                },
                goto_next_end = {
                    ["]F"] = { query = "@function.outer", desc = "Next function end" },
                    ["]C"] = { query = "@class.outer", desc = "Next class end" },
                },
                goto_previous_start = {
                    ["[f"] = { query = "@function.outer", desc = "Prev function start" },
                    ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                },
                goto_previous_end = {
                    ["[F"] = { query = "@function.outer", desc = "Prev function end" },
                    ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>sp"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
                },
                swap_previous = {
                    ["<leader>sP"] = { query = "@parameter.inner", desc = "Swap with prev parameter" },
                },
            },
        },
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "python",
            "javascript",
            "xml",
            "toml",
            "html",
            "bash",
            "csv",
            "diff",
            "fish",
            "gitcommit",
            "git_config",
            "gitignore",
            "gitattributes",
            "jq",
            "markdown",
            "markdown_inline",
            "terraform",
            "yaml",
            "yang",
            "xml",
            "vimdoc",
            "luadoc",
            "vim",
            "robot",
        },
    },
    config = function()
        vim.filetype.add({
            extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
            filename = {
                ["vifmrc"] = "vim",
            },
            pattern = {
                [".*/waybar/config"] = "jsonc",
                [".*/mako/config"] = "dosini",
                [".*/kitty/.+%.conf"] = "kitty",
                [".*/hypr/.+%.conf"] = "hyprlang",
                ["%.env%.[%w_.-]+"] = "sh",
            },
        })
        vim.treesitter.language.register("bash", "kitty")
    end,
}
