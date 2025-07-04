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
    },
    {
        "junegunn/vim-easy-align",
        cmd = { "EasyAlign" },
    },
    {
        "ggandor/lightspeed.nvim",
        event = "CursorHold",
        opts = {ignore_case = true}
    },
    { "mhinz/vim-startify", event = "BufEnter" },
    { "godlygeek/tabular", cmd = "Tabularize" },
}
