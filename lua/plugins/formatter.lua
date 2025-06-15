return {
    "mhartington/formatter.nvim",
    init = function()
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                markdown = {
                    require("formatter.filetypes.html").prettier,
                },
                python = {
                    require("formatter.filetypes.python").ruff,
                },
                lua = {
                    require("formatter.filetypes.lua").stylua,
                },
                json = {
                    require("formatter.filetypes.json").jq,
                },
                xml = {
                    require("formatter.filetypes.xml").xmllint,
                },
                yaml = {
                    require("formatter.filetypes.yaml").prettier,
                },
                html = {
                    require("formatter.filetypes.html").prettier,
                },
                terraform = {
                    require("formatter.filetypes.terraform").terraformfmt,
                },
                rust = {
                    require("formatter.filetypes.rust").rust,
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
            },
        })
    end,
}
