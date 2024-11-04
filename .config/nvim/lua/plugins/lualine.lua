return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    local lualine = require("lualine")

    -- Theme
    local custom_theme = require("lualine.themes.base16")
    -- custom_theme.inactive.a.bg = "#303030"
    custom_theme.inactive.a.fg = "#d8dee9"
    -- custom_theme.normal.a.bg = "#8FADAF"
    -- custom_theme.command.b.bg = "#ebcb8b"

    lualine.setup({
      options = {
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        section_separators = "",
        component_separators = "",
        theme = custom_theme
      },
      extensions = { "lazy", "mason", "nerdtree", "quickfix", "trouble" },
      sections = {
        -- lualine_a = {"mode"},
        -- lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {
          { "filename", path = 4, }
        },
        lualine_x = { "searchcount", "filetype" }, -- "encoding"
        -- lualine_y = {"progress"},
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
        lualine_z = {},
        -- lualine_z = {"tabs"}
      },
    })
  end,
}
