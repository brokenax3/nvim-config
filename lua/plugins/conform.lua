return {
  "stevearc/conform.nvim",
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
}
