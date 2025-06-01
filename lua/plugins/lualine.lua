-- Lualine Configuration
local project_name_display = function()
    local projections_available, Session = pcall(require, "projections.session")
    if projections_available then
        local info = Session.info(vim.loop.cwd())
        if info ~= nil then
            -- local session_file_path = tostring(info.path)
            -- local project_workspace_patterns = info.project.workspace.patterns
            -- local project_workspace_path = tostring(info.project.workspace)
            local project_name = info.project.name
            return "☺ " .. project_name
        end
    end
    return vim.fs.basename(vim.loop.cwd())
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    init = function()
        require("lualine").setup({
            options = { theme = "citruszest" },
            sections = { lualine_c = { "require'lsp-status'.status()", "filename", project_name_display } },
        })
    end,
}
