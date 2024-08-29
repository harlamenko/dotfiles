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
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- combine all code actions to one keymap
      keys[#keys + 1] = {
        "<leader>ca",
        function()
          vim.lsp.buf.code_action({ context = { only = { "quickfix", "source" } } })
        end,
        expr = true,
        desc = "[C]ode [A]ction",
        has = "codeAction",
      }

      -- remove lsp info keymap
      keys[#keys + 1] = { "<leader>cl", false }
    end,
  },
}
