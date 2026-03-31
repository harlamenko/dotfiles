local function get_snacks_directory(picker, item)
  local current = item
  if not current then
    if not picker or type(picker.current) ~= "function" then
      return nil
    end
    current = picker:current()
  end
  if not current then
    return nil
  end

  local file = current.file or current.path or current.text
  if not file or file == "" then
    return nil
  end

  local is_dir = current.dir or current.is_dir or current.type == "dir"
  if is_dir == nil then
    is_dir = vim.fn.isdirectory(file) == 1
  end

  if is_dir then
    return file
  end

  return vim.fn.fnamemodify(file, ":h")
end

return {
  { "harlamenko/ng-generate.nvim" },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = { fullscreen = true },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            layout = { fullscreen = false },
            actions = {
              ng_generate = function(picker, item)
                require("ng-generate").run_snacks(picker, item)
              end,
              grep_dir = function(picker, item)
                local path = get_snacks_directory(picker, item) or vim.fn.getcwd()
                require("fzf-lua").live_grep({
                  cwd = path,
                })
              end,
            },
            win = {
              list = {
                keys = {
                  ["n"] = "ng_generate",
                  ["<leader>sg"] = "grep_dir",
                },
              },
            },
          },
        },
      },
      styles = {
        lazygit = { width = 0, height = 0 },
      },
    },
  },
}
