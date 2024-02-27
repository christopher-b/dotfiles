return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = true,
  },
  config = function()
    vim.opt.termguicolors = true
    require 'nvim-tree'.setup({
      view = {
        side = "right",
      },
    })
  end,
  keys = {
    { "<leader>t", "<cmd>NvimTreeToggle<cr>",   desc = "NvimTree" },
    { "<leader>T", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree: current file" }
  }
}
