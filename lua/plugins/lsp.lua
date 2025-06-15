-- LSP Configurations
--

local coq = require("coq")

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        local servers = {
            -- "texlab",
            "bashls",
            -- "ccls",
            -- "ansiblels",
            "pylsp",
            "markdown_oxide",
            -- "yamlls",
            -- "terraformls",
            "rust_analyzer",
            "lua_ls",
            -- "tsserver",
        }
        local nvim_lsp = require("lspconfig")

        for _, server in pairs(servers) do
            if server == "lua_ls" then
                nvim_lsp[server].setup({
                    on_init = function(client)
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                            return
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    -- Depending on the usage, you might want to add additional paths here.
                                    -- "${3rd}/luv/library"
                                    -- "${3rd}/busted/library",
                                },
                                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                -- library = vim.api.nvim_get_runtime_file("", true)
                            },
                        })
                    end,
                    settings = {
                        Lua = {},
                    },
                })
            elseif server == "pylsp" then
                local venv_path = os.getenv("VIRTUAL_ENV")
                py_path = nil
                if venv_path ~= nil then
                    py_path = venv_path .. "/bin/python3"
                else
                    py_path = vim.g.python3_host_prog
                end
                nvim_lsp[server].setup({
                    settings = {
                        pylsp = {
                            capabilities = coq.lsp_ensure_capabilities(),
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
                                }
                            },
                        },
                    },
                })
            else
                nvim_lsp[server].setup(coq.lsp_ensure_capabilities())
            end


            -- Check if Server exists
            local cfg = nvim_lsp[server]
            if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
                print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
            end
        end
    end,
}
