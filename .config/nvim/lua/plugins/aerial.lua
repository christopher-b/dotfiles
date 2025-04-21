return {
  "stevearc/aerial.nvim",
  opts = {
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    nav = {
      preview = true,
      min_height = { 15, 0.1 },
      keymaps = {
        ["<Esc>"] = "actions.close",
      },
    },
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    -- { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial Toggle" },
    { "<leader>A", "<cmd>AerialToggle<cr>", desc = "Aerial Toggle and focus" },
    { "<leader>a", "<cmd>AerialNavToggle<cr>", desc = "Aerial Toggle and focus" },
  },
}
