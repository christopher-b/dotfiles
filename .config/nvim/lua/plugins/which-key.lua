return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").register(
      {
        c = { name = "code", },
        d = { name = "devdocs", },
        f = { name = "find", },
        g = { name = "git", },
        h = { name = "harpoon", },
        p = { name = "pretty", },
        x = { name = "trouble", },
      },
      { prefix = "<leader>" }
    )
  end,
  opts = {
    window = { border = "single" },
  }
}
