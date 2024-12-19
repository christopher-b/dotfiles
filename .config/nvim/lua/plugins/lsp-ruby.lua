return {
  "adam12/ruby-lsp.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "VonHeikemen/lsp-zero.nvim",
  },
  config = true,
  opts = {
    lspconfig = {
      init_options = {
        formatter = "standard",
        linters = { "standard" },
      },
    },
  },
}
