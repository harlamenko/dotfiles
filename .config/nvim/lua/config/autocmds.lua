-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- save all on focus lost
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "typescript", "javascript" },
  callback = function()
    vim.cmd("iabbr log console.log()<Left>")
  end,
})
