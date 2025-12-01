return {
    "marko-cerovac/material.nvim",
    opts = {
        contrast = {
            terminal = true, -- Enable contrast for the built-in terminal
            sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
            floating_windows = true, -- Enable contrast for floating windows
            cursor_line = true, -- Enable darker background for the cursor line
            lsp_virtual_text = true, -- Enable contrasted background for lsp virtual text
            non_current_windows = true, -- Enable contrasted background for non-current windows
            filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
            comments = {
                italic = true,
            },
            strings = {},
            keywords = {},
            functions = {
                bold = true,
            },
            variables = {},
            operators = {},
            types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
            "gitsigns",
            "indent-blankline",
            "telescope",
            "trouble",
            "which-key",
        },

        disable = {
            colored_cursor = false, -- Disable the colored cursor
            borders = false, -- Disable borders between vertically split windows
            background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
            term_colors = false, -- Prevent the theme from setting terminal colors
            eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility = {
            lighter = false, -- Enable higher contrast text for lighter style
            darker = false, -- Enable higher contrast text for darker style
        },

        lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

        custom_highlights = function(colors)
            return {
                ["Comment"] = { fg = colors.syntax.comments, bold = true },
                ["@markup.heading"] = { link = "" },
                ["@markup.heading.1.markdown"] = { fg = colors.main.red, bold = true },
                ["@markup.heading.2.markdown"] = { fg = colors.main.orange, bold = true },
                ["@markup.heading.3.markdown"] = { fg = colors.main.yellow, bold = true },
                ["@markup.heading.4.markdown"] = { fg = colors.main.green, bold = true },
                ["@markup.heading.5.markdown"] = { fg = colors.main.purple, bold = true },
            }
        end,
    },
}
