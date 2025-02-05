return {
    "Isrothy/neominimap.nvim",
    enabled = false,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    keys = {
        { "<leader>mt", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
        { "<leader>mf", "<cmd>Neominimap toggleFocus<cr>", desc = "Toggle focus on minimap" },
        { "<leader>mwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
        { "<leader>mwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
        { "<leader>mbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
        { "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
    },
    init = function()
        vim.opt.wrap = false -- Recommended
        vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
        vim.g.neominimap = {
            auto_enable = true,
        layout = "float",
        win_filter = function(winid)
            return winid == vim.api.nvim_get_current_win()
        end,
        }
    end,
}
