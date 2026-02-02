return {
  "sindrets/diffview.nvim",
  cmd = "DiffviewOpen",
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
          diff_binaries = false,
          winbar_info = true,
        },
      },
      hooks = {
        diff_buf_win_enter = function(_, _, ctx)
          if ctx.layout_name:match("^diff2") then
            if ctx.symbol == "a" then
              vim.opt_local.winhl = table.concat({
                "DiffAdd:DiffviewDiffAddAsDelete",
                "DiffDelete:DiffviewDiffDelete",
              }, ",")
            elseif ctx.symbol == "b" then
              vim.opt_local.winhl = table.concat({
                "DiffDelete:DiffviewDiffDelete",
              }, ",")
            end
          end
        end,
      },
    })
  end,
  init = function()
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        for _, view in ipairs(require("diffview.lib").views) do
          view:close()
        end
      end,
    })
  end,
}
