return {
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
      },
    },
    keys = {
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep with Args (root dir)",
      },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        path_display = { filename_first = { reverse_directories = false } },
      },
      extensions = {
        fzy_native = {
          override_file_sorter = false,
        },
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = function(picker)
                require("telescope-live-grep-args.actions").quote_prompt()(picker)
              end,
            },
          },
        },
      },
    },
  },
}
