return {
  { "harlamenko/ng-generate.nvim" },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = { fullscreen = true },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            layout = { fullscreen = false },
            actions = {
              ng_generate = function(picker, item)
                require("ng-generate").run_snacks(picker, item)
              end,
            },
            win = {
              list = {
                keys = {
                  ["n"] = "ng_generate",
                },
              },
            },
          },
        },
      },
      styles = {
        lazygit = { width = 0, height = 0 },
      },
    },
  },
}
