return {
    "mpas/marp-nvim",
    lazy = true,
    opts = {
        port = 8080,
        wait_for_response_timeout = 30,
        wait_for_response_delay = 1,
    },
    ft = "markdown",
}
