return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      middle_mouse_command = "bdelete! %d",
      always_show_bufferline = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "L",  function() vim.cmd("bnext " .. vim.v.count1) end, desc = "Next buffer"     },
    { "H",  function() vim.cmd("bprev " .. vim.v.count1) end, desc = "Previous buffer" },
    { "]b", function() vim.cmd("bnext " .. vim.v.count1) end, desc = "Next buffer"     },
    { "[b", function() vim.cmd("bprev " .. vim.v.count1) end, desc = "Previous buffer" },
    { "<leader>br", nil },
    { "<leader>bP", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin"    },
    { "<leader>bp", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "x non-pin buf" },
    { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>",            desc = "x buf |<--"    },
    { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>",           desc = "x buf -->|"    },
  },
}
