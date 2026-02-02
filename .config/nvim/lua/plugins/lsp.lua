return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
          },
        },
        ["*"] = {
          keys = {
            {
              "<leader>ca",
              function()
                vim.lsp.buf.code_action({ context = { only = { "quickfix", "source" } } })
              end,
              expr = true,
              desc = "[C]ode [A]ction",
              has = "codeAction",
            },
            {
              "<leader>cR",
              function()
                local inc_rename = require("inc_rename")
                return ":" .. inc_rename.config.cmd_name .. " "
              end,
              expr = true,
              desc = "Rename completely (inc-rename.nvim)",
              has = "rename",
            },
          },
        },
      },
    },
  },
}
