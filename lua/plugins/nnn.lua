return {
    "luukvbaal/nnn.nvim",
    lazy = false,
    config = function()
        local builtin = require("nnn").builtin
        require("nnn").setup({
            picker = {
                cmd = "tmux new-session nnn -a -Pp",
                style = { border = "rounded" },
                session = "shared",
            },
            replace_netrw = "picker",
            -- windownav = "<C-l>",
            mappings = {
                { "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
                { "<C-s>", builtin.open_in_split }, -- open file(s) in split
                { "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
                { "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
                { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
                { "<C-w>", builtin.cd_to_path }, -- cd to file directory
                { "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
            },
        })
    end,
}
