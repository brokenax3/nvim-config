return {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
        { "<leader>g", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    },
    opts = {
        kind = "split_below_all"
    }
}
