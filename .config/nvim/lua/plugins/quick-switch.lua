local function switch()
  return function()
    local fileName = vim.fn.expand("%")
    local filePathNoExt = vim.fn.expand("%:p:r")

    if fileName:match(".html") then
      local scssFile = filePathNoExt .. ".scss"
      if vim.fn.filereadable(scssFile) == 1 then
        vim.cmd("e " .. scssFile)
      end
    elseif fileName:match(".scss") then
      local tsFile = filePathNoExt .. ".ts"
      if vim.fn.filereadable(tsFile) == 1 then
        vim.cmd("e " .. tsFile)
      end
    elseif fileName:match(".ts") then
      local htmlFile = filePathNoExt .. ".html"
      if vim.fn.filereadable(htmlFile) == 1 then
        vim.cmd("e " .. htmlFile)
      end
    end
  end
end

vim.api.nvim_create_autocmd({ "UIEnter" }, {
  callback = function(event)
    local is_angular = next(vim.fs.find({ "angular.json", "nx.json" }, { upward = true }))

    -- Angular binds
    if is_angular then
      vim.keymap.set("n", "<A-s>", switch())
    end
  end,
})

return {}
