return {
    {
        "tpope/vim-surround",
        event = "CursorHold",
    },
    {
        "tpope/vim-repeat",
        event = "CursorHold",
    },
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "junegunn/vim-easy-align",
        cmd = { "EasyAlign" },
    },
    {
        "ggandor/lightspeed.nvim",
        config = function()
            require("lightspeed").setup({
                ignore_case = true,
            })
        end,
        event = "CursorHold",
    },
    { "mhinz/vim-startify", event = "BufEnter" },
    { "godlygeek/tabular", event = "CursorHold" },
}
