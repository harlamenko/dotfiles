-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

local map = vim.keymap.set
local del = vim.keymap.del
-- local opts = { noremap = true, silent = true }

-- Duplicate
map("n", "<leader>d", '"tY"tp', { desc = "Duplicate line below" })
map("v", "<leader>d", '"ty`>"tp', { desc = "Duplicate selection" })

-- Go to Normal mode
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")
map("i", "kk", "<esc>")

-- Copy file name and cursor position
map({ "n", "v" }, "<leader>yc", function()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local pos = r .. ":" .. c
  local file_path = vim.fn.expand("%:t")

  vim.fn.setreg("+", file_path .. ":" .. pos)
end, { desc = "Copy file name and cursor position" })

map({ "n", "v" }, "<cr>", ":wa<cr>", { desc = "Save all" })

map({ "n", "v" }, "<leader>R", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

map({ "n", "v" }, "<A-o>", LazyVim.lsp.action["source.organizeImports"], { desc = "Organize Imports" })

map({ "n", "v" }, "<A-p>", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

wk.add({
  { "<leader>m", group = "Visual Multi", mode = { "n", "v" } },
  { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
  { "<leader>ma", "<Plug>(VM-Visual-All)<Tab>", desc = "Select All", mode = "v" },
  { "<leader>ma", "<Plug>(VM-Select-All)<Tab>", desc = "Select All" },
})

wk.add({ { "gp", "`[v`]", desc = "Select pasted text", mode = { "n", "v" } } })

-- Keys for diff resolution
wk.add({
  cond = vim.opt.diff:get(),

  { ",g", ":diffget<CR>", mode = { "n", "v" }, desc = "diff[g]et" },
  { ",p", ":diffput<CR>", mode = { "n", "v" }, desc = "diff[p]ut" },
  { ",u", ":diffupdate<CR>", mode = { "n", "v" }, desc = "diffupdate" },

  { ",l", ":diffget LO<CR>", mode = { "n", "v" }, desc = "diffget [L]OCAL" },
  { ",b", ":diffget BA<CR>", mode = { "n", "v" }, desc = "diffget [B]ASE" },
  { ",r", ":diffget RE<CR>", mode = { "n", "v" }, desc = "diffget [R]EMOTE" },
})
