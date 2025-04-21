return {
  "echasnovski/mini.nvim",
  version = "*",
  init = function()
    require("mini.pairs").setup()
    -- require('mini.ai').setup() -- Text objects
  end,
}
