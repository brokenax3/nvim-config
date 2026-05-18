return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function() require("conform").format({ async = true }) end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "goimports", "gofmt" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd" },
            markdown = { "prettierd" },
            yaml = { "yamlfix" },
            html = { "html_beautify" },
            json = { "prettierd" },
            robot = { "robocop" },
            terraform = { "terraform_fmt" },
            xml = { "xmllint" },
            toml = { "tombi" },
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
            yamlfix = {
                prepend_args = { "--config-file", "/Users/markle/.yamlfix.toml" },
            },
        },
    },
    keys = {
        { "<leader>cf", function() require("conform").format() end },
    },
}
