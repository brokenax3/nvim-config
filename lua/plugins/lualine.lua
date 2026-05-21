return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "kanagawa-paper-ink",
            disabled_filetypes = {
                statusline = { "snacks_picker_input", "snacks_explorer" },
                winbar = { "snacks_picker_input", "snacks_explorer" },
            },
        },
    },
}
