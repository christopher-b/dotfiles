return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>mp",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
          timeout_ms = 1000,
        })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- Define your formatters
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
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true, async = false },

    -- Customize formatters
    -- formatters = {
    --   shfmt = {
    --     prepend_args = { "-i", "2" },
    --   },
    -- },
  },
  -- init = function()
  --   -- If you want the formatexpr, here is the place to set it
  --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- end,
}
