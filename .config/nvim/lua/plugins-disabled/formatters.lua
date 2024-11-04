return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>pf",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
          timeout_ms = 1000,
        })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
      ruby = { "standardrb" },
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_fallback = true,
      -- async = false
    },
  },
}
