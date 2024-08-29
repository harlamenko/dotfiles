return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
    max_join_length = 999,
  },
  keys = {
    {
      "<space>cm",
      ":TSJToggle<cr>",
      desc = "Split or Join code block with autodetect",
      mode = "n",
    },
    {
      "<space>cs",
      ":TSJSplit<cr>",
      desc = "Split code block",
      mode = "n",
    },
    {
      "<space>cj",
      ":TSJJoin<cr>",
      desc = "Join code block",
      mode = "n",
    },
  },
}
