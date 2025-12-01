-- LSP Configurations
--

local coq = require("coq")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        local servers = {
            "texlab",
            "bashls",
            -- "ccls",
            -- "ansiblels",
            "pylsp",
            -- "markdown_oxide",
            "zk",
            -- "yamlls",
            -- "terraformls",
            -- "rust_analyzer",
            -- "lua_ls",
            "gopls",
            "tsserver",
        }
        local nvim_lsp = require("lspconfig")

        for _, server in pairs(servers) do
            if server == "pylsp" then
                local venv_path = os.getenv("VIRTUAL_ENV")
                py_path = nil
                if venv_path ~= nil then
                    py_path = venv_path .. "/bin/python3"
                else
                    py_path = vim.g.python3_host_prog
                end
                vim.lsp.config(server, {
                    settings = {
                        pylsp = {
                            capabilities = capabilities,
                            plugins = {
                                pylsp_mypy = {
                                    enabled = true,
                                    overrides = { "--python-executable", py_path, true },
                                    report_progress = true,
                                    live_mode = true,
                                },
                                jedi_completion = { fuzzy = true },
                                pycodestyle = {
                                    enabled = false,
                                    maxLineLength = 120,
                                },
                                isort = { enabled = true },
                                ruff = {
                                    enabled = true,
                                    formatEnabled = true,
                                },
                            },
                        },
                    },
                })
            else
                vim.lsp.config(server, { settings = { capabilities = capabilities } })
            end
            vim.lsp.config(server, coq.lsp_ensure_capabilities())
            vim.lsp.enable(server)

            -- Check if Server exists
            if not (vim.lsp.is_enabled(server)) then print(server .. ": cmd not found.") end
        end
    end,
}
