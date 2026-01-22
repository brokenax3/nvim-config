return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      replace_netrw = true, -- Replace netrw with the snacks explorer
      trash = true, -- Use the system trash when deleting files
    },
    picker = {
      files = {
        cmd = "rg",
        ignored = true,
      },
      sources = {
        explorer = {
          hidden = true,
          on_show = function(picker)
            local Tree = require("snacks.explorer.tree")
            local root = Tree:find(picker:cwd())
            local open_recursive = false
            Tree:walk(root, function(node)
              if node.dir and (open_recursive or root == node.parent) then
                Tree:open(node.path)
                Tree:expand(node)
              end
            end, { all = open_recursive })
          end,
        },
      },
    },
  },
}
