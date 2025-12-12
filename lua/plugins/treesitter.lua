-- Treesitter
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false, -- Enable multiwindow support.
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            },
        },
        "RRethy/nvim-treesitter-textsubjects",
        'JoosepAlviste/nvim-ts-context-commentstring'
    },
    opts = function(_, opts)
        local function add(lang)
            if type(opts.ensure_installed) == "table" then table.insert(opts.ensure_installed, lang) end
        end

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
    config = function()
        require("nvim-treesitter.configs").setup({
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
            highlight = {
                enable = true,
                -- additional_vim_regex_highlighting = { "markdown" },
                disable = true,
            },
            indent = {
                enable = true,
                -- disable = { "yaml" },
            },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    -- Set to false if you have an `updatetime` of ~100.
                    clear_on_cursor_move = true,
                },
                -- highlight_current_scope = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = "grr",
                    },
                },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = "gnd",
                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                        goto_next_usage = "<a-*>",
                        goto_previous_usage = "<a-#>",
                    },
                },
            },
            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",
                        ["uc"] = "@comment.outer",
                        ["aa"] = "@assignment.outer",
                        ["ia"] = "@assignment.inner",
                        ["la"] = "@assignment.lhs",
                        ["ra"] = "@assignment.rhs",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                },
            },
            textsubjects = {
                enable = true,
                prev_selection = ",", -- (Optional) keymap to select the previous selection
                keymaps = {
                    ["."] = "textsubjects-smart",
                    [";"] = "textsubjects-container-outer",
                    ["i;"] = {
                        "textsubjects-container-inner",
                        desc = "Select inside containers (classes, functions, etc.)",
                    },
                },
            },
        })
    end,
}
