-- Enhances existing formatting capabilities and fixes bad-behaving LSP formatters
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      -- ruby = { "standardrb" }
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    -- formatters = {
    --   shfmt = { prepend_args = { "-i", "2" }, },
    -- },
  },
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
}
