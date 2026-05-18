return {
  "nvim-mini/mini.comment",
  opts = {
    options = {
      custom_commentstring = function(_)
        if vim.bo.filetype == "jinja" then
          return "{# %s #}"
        end
      end,
    },
  },
}
