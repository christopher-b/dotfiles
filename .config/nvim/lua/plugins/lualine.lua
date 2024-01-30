return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- Theme
    local custom_theme = require("lualine.themes.base16")
    -- custom_theme.normal.a.bg = "#8fadaf"
    custom_theme.inactive.a.bg = "#303030"
    custom_theme.command.c.bg = "#303030"

    lualine.setup({
      -- options = { theme = "base16" },
      options = { theme = custom_theme },
      extensions = {"quickfix", "fugitive", "lazy", "quickfix"},
      sections = {
        lualine_x = {
          -- {
          --   lazy_status.updates,
          --   cond = lazy_status.has_updates,
          --   color = { fg = "#ff9e64" },
          -- },
          { "searchcount" },
          { "encoding" },
          { "filetype" },
        },
        -- lualine_y = {""},
        -- lualine_z = {"location", "progress"},
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
        lualine_z = {"tabs"}
      },
    })
  end,
}

--[[[[
      vim.g.airline_theme = "deus"
      let g:airline#extensions#ale#enabled = 1
      let g:airline#extensions#battery#enabled = 1
      let g:airline_section_y = airline#section#create(["battery"])
--]]

