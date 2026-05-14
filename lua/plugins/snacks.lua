return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      replace_netrw = true, -- Replace netrw with the snacks explorer
      trash = true, -- Use the system trash when deleting files
    },
    picker = {
      main = {
        file = true,
        current = true,
      },
      hidden = true,
      files = {
        cmd = "rg",
        ignored = true,
        hidden = true,
      },
      sources = {
        explorer = {
          hidden = true,
          main = { current = false },
        },
        buffers = {
          current = false,
        },
      },
      matcher = {
        cwd_bonus = true,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        if Snacks.picker.get({ source = "explorer" })[1] == nil then
          Snacks.picker.explorer()
        elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == false then
          Snacks.picker.get({ source = "explorer" })[1]:focus()
        elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == true then
          vim.cmd("wincmd p")
        end
      end,
    },
  },
}
