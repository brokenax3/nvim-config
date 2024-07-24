-- Telescope

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        {
            "jvgrootveld/telescope-zoxide",
        },
        -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    init = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "-u",
                },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
                prompt_prefix = "> ",
                selection_caret = "> ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "flex",
                layout_config = {
                    horizontal = {
                        mirror = false,
                        preview_width = 0.6,
                    },
                    vertical = {
                        mirror = false,
                        preview_height = 0.6,
                    },
                    preview_cutoff = 40,
                },
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                -- file_sorter = require("telescope.sorters").get_fzy_sorter,
                file_ignore_patterns = {},
                -- generic_sorter = require("telescope.sorters").get_fzy_sorter,
                winblend = 0,
                border = {},
                borderchars = {
                    "─",
                    "│",
                    "─",
                    "│",
                    "╭",
                    "╮",
                    "╯",
                    "╰",
                },
                color_devicons = true,
                use_less = true,
                path_display = { shorten = 5 },
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

                -- Developer configurations: Not meant for general override
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            },
            pickers = {
                -- Your special builtin config goes in here
                buffers = {
                    sort_lastused = true,
                    theme = "ivy",
                    mappings = {
                        i = {
                            ["<c-d>"] = require("telescope.actions").delete_buffer,
                            -- Right hand side can also be the name of the action as a string
                            -- ["<c-d>"] = "delete_buffer",
                        },
                        n = {
                            ["<c-d>"] = require("telescope.actions").delete_buffer,
                        },
                    },
                },
                find_files = {
                    theme = "ivy",
                },
            },
            extensions = {
                -- fzf = {
                --     fuzzy = true, -- false will only do exact matching
                --     override_generic_sorter = true, -- override the generic sorter
                --     override_file_sorter = true, -- override the file sorter
                --     case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                --     -- the default case_mode is "smart_case"
                -- },
                heading = {
                    treesitter = true,
                },
            },
        })

        -- require("telescope").load_extension("projects")
        --require("telescope").load_extension("fzf")
        require("telescope").load_extension("neoclip")
        require("telescope").load_extension("zoxide")
    end,
}
