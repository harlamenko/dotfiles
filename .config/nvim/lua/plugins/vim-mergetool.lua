return {
  "samoshkin/vim-mergetool",
  lazy = false,
  init = function()
    vim.g.mergetool_layout = "mr"
    vim.g.mergetool_prefer_revision = "local"
  end,
}
