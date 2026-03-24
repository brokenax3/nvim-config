vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.md%.tmpl"] = "gotmpl",
  },
})
