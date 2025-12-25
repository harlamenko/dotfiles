return {
  { "harlamenko/ng-generate.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["?"] = false,
          ["g?"] = "show_help",

          ["H"] = false,
          ["g."] = "toggle_hidden",

          ["i"] = false,
          ["K"] = "show_file_details",

          ["h"] = false,
          ["-"] = "close_node",

          ["n"] = function(state)
            require("ng-generate").run(state)
          end,
        },
      },
    },
  },
}
