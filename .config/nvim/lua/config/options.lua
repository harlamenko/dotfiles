-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

vim.opt.title = true
vim.opt.titlelen = 70
local project = vim.fn.getcwd():gsub("^.*/", "")
vim.opt.titlestring = project .. " %-25.55F"
