-- VIMTEX
return {
    "lervag/vimtex",
    enabled = false,
    init = function()
        vim.g.vimtex_compiler_progname = "nvr"
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_fold_enabled = 1
        -- vim.g.vimtex_quickfix_enabled = 0
        -- vim.g.vimtex_compiler_method = 'latexmk'
        -- vim.g.vimtex_compiler_latexrun_engines = 'lualatex'
        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-pdf",
                "-pdflatex='xelatex --shell-escape %O %S'",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
    end,
}
