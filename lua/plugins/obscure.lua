return {
    "killitar/obscure.nvim",
    config = function()
        require("obscure").setup({
            styles = {
                booleans = { italic = true, bold = true },
            },
            on_highlights = function(hl, c)
                hl["@markup.heading.1"] = { fg = c.red }
                hl["@markup.heading.2"] = { fg = c.purple }
                hl["@markup.heading.3"] = { fg = c.yellow }
                hl["@markup.heading.4"] = { fg = c.magenta }
                hl["@markup.heading.5"] = { fg = c.blue }
            end,
        })
    end,
}
