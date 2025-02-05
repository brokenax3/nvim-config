return {
    {
        "mhartington/formatter.nvim",
        event = "VeryLazy",
        init = function()
            require("formatter").setup({
                logging = true,
                log_level = vim.log.levels.WARN,
                filetype = {
                    markdown = {
                        function()
                            return {
                                exe = "prettier",
                                args = {
                                    "--config",
                                    "~/.config/prettierrc.toml",
                                    "--stdin-filepath",
                                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                },
                                stdin = true,
                            }
                        end,
                    },
                    python = {
                        require("formatter.filetypes.python").black,
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
                    terraform = {
                        require("formatter.filetypes.terraform").terraformfmt,
                    },
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,
                    },
                },
            })
        end,
    },
}
