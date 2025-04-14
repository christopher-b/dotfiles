-- Enhances existing formatting capabilities and fixes bad-behaving LSP formatters
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      typescript = { "prettier" },
      yaml = { "prettier" },
      -- ruby = { "standardrb" } -- we use the LSP
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- This sets up a format-on-save autocommand
    format_on_save = {
      timeout_ms = 500,
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          async = true,
          lsp_format = "first",
        })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
}
