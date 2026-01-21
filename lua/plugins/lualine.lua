return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = { theme = "gruvbox-material" },
        sections = { lualine_c = { "require'lsp-status'.status()", "filename", project_name_display } },
    }
}
