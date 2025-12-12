return {
    "nvim-mini/mini.indentscope",
    version = "*",
    init = function()
        require("mini.indentscope").setup({
            options = {
                try_as_border = true
            },
        })
    end,
}
