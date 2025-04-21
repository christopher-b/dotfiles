return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Files",
          text_align = "center",
          -- separator = true,
        },
      },
      -- Show diagnostic counts
      custom_areas = {
        right = function()
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
          local info = #vim.diagnostic.get(0, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

          if error ~= 0 then table.insert(result, { text = "  " .. error, link = "DiagnosticError" }) end
          if warning ~= 0 then table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" }) end
          if hint ~= 0 then table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" }) end
          if info ~= 0 then table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" }) end

          return result
        end,
      },
    },
  },
  -- config = function()
  --   local bufferline = require("bufferline")
  --   bufferline.setup({
  --     style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
  --   })
  -- end,
}
