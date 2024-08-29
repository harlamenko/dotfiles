return {
  "kassio/neoterm",
  lazy = false,
  init = function()
    vim.g.neoterm_size = tostring(0.3 * vim.o.columns)
    vim.g.neoterm_default_mod = "botright vertical"

    vim.api.nvim_create_user_command("NgGenerateDirective", function(input)
      vim.api.nvim_command(":1Tclear")
      vim.api.nvim_command(":1T npx ng g d " .. input.args)
    end, { nargs = "*" })
  end,
}
