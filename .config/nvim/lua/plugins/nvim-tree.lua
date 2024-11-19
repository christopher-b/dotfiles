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
    { "<leader>T", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree: current file" },
    -- { "<leader>tm", tree_actions_menu, { buffer = 0, noremap = true, silent = true }}
    -- vim.keymap.set("n", "<C-Space>", tree_actions_menu,
    -- { buffer = buffer, noremap = true, silent = true })
  }
}
