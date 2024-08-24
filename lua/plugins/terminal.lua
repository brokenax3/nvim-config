return {
    "rebelot/terminal.nvim",
    config = function()
        require("terminal").setup(
{
    layout = { open_cmd = "belowright vnew" },
    cmd = { vim.o.shell },
    autoclose = false,
}
        )

    end,
}
