local lua_ls_config = require("plugins.lsp.lua_ls")

return {
    "neovim/nvim-lspconfig",
    init = function()
        local servers = {
            "texlab",
            "bashls",
            -- "ccls",
            "ansiblels",
            "pylsp",
            -- "markdown_oxide",
            "zk",
            "yamlls",
            "terraformls",
            -- "rust_analyzer",
            "lua_ls",
            "tombi",
            "gopls",
            "robotcode",
            -- "tsserver",
        }
        vim.lsp.config("lua_ls", lua_ls_config)
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        for _, server in pairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities
            })
            vim.lsp.enable(server)
        end
    end,
}
