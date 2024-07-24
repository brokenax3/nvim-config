-- Configuration for Neovim Completion
return {
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {
        {
            "ms-jpq/coq.artifacts",
            branch = "artifacts",
        },
        { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
    config = function()
        -- require("coq").setup({
        --     coq_settings = {
        --         keymap = {
        --             bigger_preview = nil,
        --         },
        --     },
        -- })
    end,
}
