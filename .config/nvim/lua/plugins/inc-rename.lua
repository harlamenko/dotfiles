return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = {
      "<leader>cR",
      function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " "
      end,
      expr = true,
      desc = "Rename completely (inc-rename.nvim)",
      has = "rename",
    }
  end,
}
