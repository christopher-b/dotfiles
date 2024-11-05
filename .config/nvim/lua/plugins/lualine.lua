return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    -- options = {
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      -- section_separators = "",
      -- component_separators = "",
      -- theme = custom_theme
    -- },
    extensions = { "lazy", "mason", "nerdtree", "quickfix", "trouble" },
    sections = {
      lualine_a = {
        {
          "mode",
          color = { gui = "NONE" },
        },
      },
      -- lualine_b = {"branch", "diff", "diagnostics"},
      lualine_c = {
        { "filename", path = 4, }
      },
      lualine_x = {
        "searchcount",
        "filetype",
        {
          -- Show LSP servers
          function()
            local clients = vim.lsp.get_clients( { bufnr = 0 })
            if next(clients) == nil then
              -- return "No LSP"
              return ""
            end

            local client_names = {}
            for _, client in pairs(clients) do
              table.insert(client_names, client.name)
            end

            return table.concat(client_names, "/")
          end,
          icon = "󰅩"
        },

      }, -- "encoding"
      -- lualine_y = {"progress"},
    },
    tabline = {
      lualine_a = {
        {
          "buffers",
          color = { gui = "NONE" },
          use_mode_colors = true,
          buffers_color = { active = { gui = "NONE" } },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
      -- lualine_z = {"tabs"}
    },
  },
  -- config = function()
  --   local lualine = require("lualine")
  --
  --   -- Theme
  --   -- local custom_theme = require("lualine.themes.base16")
  --   -- custom_theme.inactive.a.bg = "#303030"
  --   -- custom_theme.inactive.a.fg = "#d8dee9"
  --   -- custom_theme.normal.a.bg = "#8FADAF"
  --   -- custom_theme.command.b.bg = "#ebcb8b"
  --
  --   lualine.setup({
  --     options = {
  --       -- section_separators = { left = "", right = "" },
  --       -- component_separators = { left = "", right = "" },
  --       section_separators = "",
  --       component_separators = "",
  --       theme = custom_theme
  --     },
  --     extensions = { "lazy", "mason", "nerdtree", "quickfix", "trouble" },
  --     sections = {
  --       -- lualine_a = {"mode"},
  --       -- lualine_b = {"branch", "diff", "diagnostics"},
  --       lualine_c = {
  --         { "filename", path = 4, }
  --       },
  --       lualine_x = { "searchcount", "filetype" }, -- "encoding"
  --       -- lualine_y = {"progress"},
  --     },
  --     tabline = {
  --       lualine_a = {
  --         {
  --           "buffers",
  --           color = { gui = "NONE" },
  --           -- use_mode_colors = true,
  --         },
  --       },
  --       lualine_b = {},
  --       lualine_c = {},
  --       lualine_x = {},
  --       lualine_y = {},
  --       lualine_z = {},
  --       -- lualine_z = {"tabs"}
  --     },
  --   })
  -- end,
}
