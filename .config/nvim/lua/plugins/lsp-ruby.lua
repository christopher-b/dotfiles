return {
  "adam12/ruby-lsp.nvim",
  -- dir = "~/src/ruby-lsp.nvim/",
  -- dev = true,
  ft = { "ruby", "eruby" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
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
  keys = {
    {
      "<leader>ca",
      function()
        vim.lsp.codelens.run()
      end,
      desc = "Run Code Lens",
    },
  },
}
