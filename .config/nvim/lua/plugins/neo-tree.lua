local inputs = require("neo-tree.ui.inputs")

return {
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

        ["<space>Gd"] = {
          function(state)
            local node = state.tree:get_node()
            local path, b = node:get_id():gsub("\\", "/")
            local relative_path = path:match("src/app/(.+)")

            return inputs.input("Directive name:", "", function(destinations)
              if not destinations then
                return
              end

              vim.cmd("NgGenerateDirective " .. relative_path .. "/" .. destinations)
            end)
          end,
          desc = "Generate directive",
        },
      },
    },
  },
}
