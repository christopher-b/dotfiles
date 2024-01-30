return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  opts = {
    -- previewer_cmd = "glow",
    -- cmd_args = { "-s", "dark", "-w", "80" },
    -- picker_cmd_args = { "-s", "dark", "-w", "50" },
    mappings = { -- keymaps for the doc buffer
      open_in_browser = "<leader>oo<cr>"
    },
  },
  keys = {
    { "<leader>di", "<cmd>DevdocsInstall<cr>",   desc = "Install docs" },
    { "<leader>do", "<cmd>DevdocsOpenFloat<cr>", desc = "Open docs" },
    { "<leader>dt", "<cmd>DevdocsToggle<cr>",    desc = "Toggle devdocs floating window" },
  },
}
