return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd" },
            markdown = { "prettierd" },
            yaml = { "prettierd" },
            html = { "prettierd" },
            terraform = { "terraform_fmt" },
            xml = { "xmllint" },
            ["_"] = { "trim_whitespace" },
        },
    },
}
