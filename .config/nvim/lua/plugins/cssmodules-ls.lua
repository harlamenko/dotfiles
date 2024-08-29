return {
  "antonk52/cssmodules-language-server",
  ft = "typescriptreact",
  event = "VeryLazy",
  -- Not load for angular projects
  enabled = function()
    return false
    -- return not next(vim.fs.find({ "angular.json", "nx.json" }, { upward = true }))
  end,
}
