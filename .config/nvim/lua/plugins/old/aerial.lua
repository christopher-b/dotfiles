return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "AerialPrev" })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "AerialNext" })
      end,
    })
  end,
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<cr>",    desc = "AerialToggle" },
    { "<leader>A", "<cmd>AerialNavToggle!<cr>", desc = "AerialNavToggle" },
  },
}
