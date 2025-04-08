return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  opts = {
    mappings = { -- keymaps for the doc buffer
      open_in_browser = "<leader>oo<cr>"
    },
  },
  keys = {
    { "<leader>di", "<cmd>DevdocsInstall<cr>",   desc = "Install devdocs" },
    { "<leader>do", "<cmd>DevdocsOpenFloat<cr>", desc = "Open devdocs" },
    { "<leader>dt", "<cmd>DevdocsToggle<cr>",    desc = "Toggle devdocs floating window" },
  },
}
