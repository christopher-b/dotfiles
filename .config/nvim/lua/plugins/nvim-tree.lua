return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = true,
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    require 'nvim-tree'.setup {}
  end,
  keys = {
    { "<leader>d", "<cmd>NvimTreeToggle<cr>" }
  }
}
