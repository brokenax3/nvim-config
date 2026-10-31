return {
    "mcauley-penney/visual-whitespace.nvim",
    -- event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {
        enabled = false,
    },
    keys = {
        { "<leader>tw", function() require("visual-whitespace").toggle() end, desc = "Visual Whitespace Toggle" },
    },
}
