return {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    -- event = "BufRead",
    config = function()
        require("colorizer").setup()
    end,
}
