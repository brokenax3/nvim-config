return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python", -- Python Debugger Adapter
    },
    config = function()
        require("dapui").setup()
        require("dap-python").setup("venv/bin/python")
    end,
}
