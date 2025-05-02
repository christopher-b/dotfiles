return {
  "echasnovski/mini.nvim",
  version = "*",
  init = function()
    require("mini.pairs").setup({
      mappings = {
        ["|"] = { action = "closeopen", pair = "||", neigh_pattern = "[^\\].", register = { cr = false } },
      },
    })
    -- require('mini.ai').setup() -- Text objects
  end,
}
