local function switch()
  return function()
    local fileName = vim.fn.expand("%")
    local filePathNoExt = vim.fn.expand("%:p:r")

    if fileName:match(".component.html") then
      vim.cmd("e " .. filePathNoExt .. ".scss")
    elseif fileName:match(".component.scss") then
      vim.cmd("e " .. filePathNoExt .. ".ts")
    elseif fileName:match(".component.ts") then
      vim.cmd("e " .. filePathNoExt .. ".html")
    end
  end
end

vim.api.nvim_create_autocmd({ "UIEnter" }, {
  callback = function(event)
    local is_angular = next(vim.fs.find({ "angular.json", "nx.json" }, { upward = true }))

    -- Angular binds
    if is_angular then
      vim.keymap.set("n", "<A-s>", switch())

      -- goto CSS/style files
      -- vim.keymap.set("n", "<leader>js", find(".+css|.+scss|.+sass", { regex = true, prefix = "full" }), opts)
      -- vim.keymap.set("n", "<leader>jt", find(".component.html"), opts) -- goto html
      -- vim.keymap.set("n", "<leader>jc", find(".component.ts"), opts) -- goto script
      --
      -- -- goto test files
      -- vim.keymap.set("n", "<leader>gtt", find(".+spec", { regex = true, prefix = "full" }), opts)
      --
      -- vim.keymap.set("n", "<leader>gtm", find(".module.ts"), opts) -- goto module
      -- vim.keymap.set("n", "<leader>gtv", find(".service.ts"), opts) -- goto serVice
    end
  end,
})

return {}
