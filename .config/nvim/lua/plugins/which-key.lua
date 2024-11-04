return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- sort = { "alphanum", "local", "order", "group", "mod" },
    spec = {
      { "<leader>c", group = "code" },
      { "<leader>d", group = "devdocs" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "harpoon" },
      { "<leader>p", group = "pretty" },
      { "<leader>x", group = "trouble" },
    },
    win = { title = true }
  }
}
