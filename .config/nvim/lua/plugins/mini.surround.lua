return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = ";;",
      delete = ";d",
      find = ";f",
      find_left = ";F",
      highlight = ";h",
      replace = ";r",
      update_n_lines = ";n",
    },
  },
  init = function()
    local custom_surroundings = {
      markdown = {
        ["B"] = { -- Surround for bold
          input = { "%*%*().-()%*%*" },
          output = { left = "**", right = "**" },
        },
        ["I"] = { -- Surround for italics
          input = { "%_().-()%_" },
          output = { left = "_", right = "_" },
        },
        ["M"] = { -- Surround for monospace
          input = { "%`().-()%`" },
          output = { left = "`", right = "`" },
        },
        ["L"] = {
          input = { "%[().-()%]%([^)]+%)" },
          output = function()
            local href = require("mini.surround").user_input("Href")
            return {
              left = "[",
              right = "](" .. href .. ")",
            }
          end,
        },
        ["R"] = {
          input = { "%[().-()%]%[[^)]+%]" },
          output = function()
            local label = require("mini.surround").user_input("Label")
            return {
              left = "[",
              right = "][" .. label .. "]",
            }
          end,
        },
      },
      typescript = {
        ["a"] = {
          input = { "%(().-()%)" },
          output = { left = "(", right = " as any)" },
        },
      },
      typescriptreact = {
        ["a"] = {
          input = { "%(().-()%)" },
          output = { left = "(", right = " as any)" },
        },
      },
      htmlangular = {
        ["a"] = {
          input = { "%(().-()%)" },
          output = { left = "$any(", right = ")" },
        },
      },
    }
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("dotfiles-mini_surround", {}),
      pattern = vim.fn.join(vim.tbl_keys(custom_surroundings), ","),
      callback = function()
        local ft = vim.opt.filetype:get()
        vim.b.minisurround_config = {
          custom_surroundings = custom_surroundings[ft],
        }
      end,
    })
  end,
}
