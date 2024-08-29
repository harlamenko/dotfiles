-- KeyMappings https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-mappings.txt
-- https://github.com/mg979/vim-visual-multi/blob/38b0e8d94a5499ccc17d6159763d32c79f53417b/autoload/vm/maps/all.vim#L160
return {
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_mouse_mappings = 1

      vim.g.VM_maps = {
        ["Find Under"] = "<C-A-l>",
        ["Find Subword Under"] = "<C-A-l>",
        ["Select Cursor Down"] = "<C-A-j>",
        ["Select Cursor Up"] = "<C-A-k>",
      }
    end,
  },
}
