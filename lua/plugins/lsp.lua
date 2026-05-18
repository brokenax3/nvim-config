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
            -- "tsserver",
        }
	vim.lsp.config("lua_ls", lua_ls_config)

        for _, server in pairs(servers) do
            vim.lsp.enable(server)
        end
    end,
}
