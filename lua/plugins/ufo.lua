return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    init = function() require("ufo").setup() end,
    keys = {
        {
            "zR",
            function() require("ufo").openAllFolds() end,
            mode = "n",
            desc = "Open All Folds (nvim-ufo)",
        },
        {
            "zM",
            function() require("ufo").closeAllFolds() end,
            mode = "n",
            desc = "Close All Folds (nvim-ufo)",
        },
        {
            "zr",
            function() require("ufo").openFoldsExceptKinds() end,
            mode = "n",
            desc = "Open All Folds (nvim-ufo)",
        },
        {
            "zm",
            function() require("ufo").closeFoldsWith() end,
            mode = "n",
            desc = "Close All Folds (nvim-ufo)",
        },
        {
            "K",
            function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end,
            mode = "n",
            desc = "Open All Folds (nvim-ufo)",
        },
    },
}
