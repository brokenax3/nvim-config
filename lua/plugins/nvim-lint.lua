return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        prepend_args = { "--config", vim.env.HOME .. "/.config/LazyVimDev/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
