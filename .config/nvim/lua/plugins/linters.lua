return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = {
    linters_by_ft = {
      javascript = { "eslint_d" },
      -- ruby = { "standardrb" },
    }
  },
  config = function()
    local lint = require("lint")
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>pl", function()
      lint.try_lint()
    end, { desc = "Linting buffer" })
  end,
}
