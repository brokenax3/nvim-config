-- LSP Configurations
--

local coq = require("coq")

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        local servers = {
            -- "texlab",
            -- "bashls",
            -- "ccls",
            "pyright",
            "yamlls",
            "terraformls",
            "rust_analyzer",
            -- "tsserver",
        }
        local nvim_lsp = require("lspconfig")
        local capabilities = coq.lsp_ensure_capabilities()

        for _, server in pairs(servers) do
            nvim_lsp[server].setup({
                on_attach = lsp_on_attach,
                capabilities = capabilities,
            })
            local cfg = nvim_lsp[server]
            if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
                print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
            end
        end
    end,
}
