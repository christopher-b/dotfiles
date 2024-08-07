return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status")

    -- Theme
    local custom_theme = require("lualine.themes.base16")
    custom_theme.inactive.a.bg = "#303030"
    custom_theme.command.c.bg = "#303030"

    lualine.setup({
      options = { theme = custom_theme },
      extensions = { "quickfix", "fugitive", "lazy", "quickfix" },
      sections = {
        lualine_x = {
          { "searchcount" },
          { "encoding" },
          { "filetype" },
        },
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            use_mode_colors = true,
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        -- lualine_z = {"tabs"}
      },
    })
  end,
}
