local symbols = {
  git_merge = "↸ ",
  normal_diff = "↹ ",
}
local git_branch = function()
  local symbol = symbols.git_branch

  if vim.g.mergetool_in_merge_mode == 1 then
    symbol = symbols.git_merge
  elseif vim.wo.diff then
    symbol = symbols.normal_diff
  end

  local branch = vim.b.gitsigns_head and symbol .. vim.b.gitsigns_head or ""
  return vim.trim(branch)
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    sections = {
      lualine_b = {
        {
          git_branch,
          color = function()
            if vim.g.mergetool_in_merge_mode == 1 then
              return { fg = "#ffffff", gui = "bold" }
            end

            return nil
          end,
        },
      },
      lualine_z = { "encoding" },
    },
  },
}
