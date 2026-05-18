return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
        indent = { enable = true },
        highlight = { enable = true },
        folds = { enable = true },
        move = { 
            set_jumps = true,
        },
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "python",
            "javascript",
            "xml",
            "toml",
            "html",
            "bash",
            "csv",
            "diff",
            "fish",
            "gitcommit",
            "git_config",
            "gitignore",
            "gitattributes",
            "jq",
            "markdown",
            "markdown_inline",
            "terraform",
            "yaml",
            "yang",
            "xml",
            "vimdoc",
            "luadoc",
            "vim",
            "robot",
        },
    },
    config = function()
        vim.filetype.add({
            extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
            filename = {
                ["vifmrc"] = "vim",
            },
            pattern = {
                [".*/waybar/config"] = "jsonc",
                [".*/mako/config"] = "dosini",
                [".*/kitty/.+%.conf"] = "kitty",
                [".*/hypr/.+%.conf"] = "hyprlang",
                ["%.env%.[%w_.-]+"] = "sh",
            },
        })
        vim.treesitter.language.register("bash", "kitty")
    end,
}
