local zk = require("zk")
local commands = require("zk.commands")
local notes_dir = "/Users/markle/git/mark-brain"

commands.add("ZkDaily", function()
  commands.get("ZkNew")({ dir = notes_dir .. "/02-journal" })
end)

commands.add("ZkInbox", function(options)
  options = vim.tbl_extend("force", { orphan = true }, options or {})
  commands.get("ZkNew")(options, { dir = notes_dir .. "/01-inbox" })
end)
