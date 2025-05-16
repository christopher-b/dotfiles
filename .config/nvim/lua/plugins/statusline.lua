return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    options = {
      disabled_filetypes = { "NvimTree", "Avante", "AvanteSelectedFiles", "AvanteInput" },
    },
    extensions = { "lazy", "mason", "nerdtree", "quickfix", "trouble" },
    sections = {
      lualine_a = {
        {
          "mode",
          color = { gui = "NONE" },
        },
      },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        { "filename", path = 4 },
        { "aerial", dense = true, dense_sep = "/" },
      },
      lualine_x = {
        "searchcount",
        "filetype",
        -- "encoding",
        {
          -- Show LSP servers
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
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
          -- icon = "󰅩",
        },
      },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", color = { gui = "NONE" } },
      },
    },
    -- tabline = {
    --   lualine_a = {
    --     {
    --       "buffers",
    --       color = { gui = "NONE" },
    --       use_mode_colors = true,
    --       buffers_color = { active = { gui = "NONE" } },
    --     },
    --   },
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    --   -- lualine_z = {"tabs"}
    -- },
  },
}
