return {
  "zk-org/zk-nvim",
  opts = {
    picker = "telescope",
  },
  config = function(_, opts)
    require("zk").setup(opts)
  end,
}
