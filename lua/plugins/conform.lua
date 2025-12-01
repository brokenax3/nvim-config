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
            html = { "html_beautify" },
            json = { "prettierd" },
            robot = { "robocop" },
            terraform = { "terraform_fmt" },
            xml = { "xmllint" },
            ["_"] = { "trim_whitespace" },
        },
        formatters = {
            black = {
                prepend_args = { "--line-length", "120" },
            },
            robocop = {
                command = "/opt/homebrew/bin/robocop",
                args = { "format", "$FILENAME" },
                stdin = false,
            },
        },
    },
}
