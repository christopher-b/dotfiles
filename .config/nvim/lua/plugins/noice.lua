-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      lsp_doc_border = true, -- add a border to hover docs and signature help
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
    },
    -- Display macro recording messages
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 1 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
      -- cmdline_popup = {
      --   position = {
      --     row = 5,
      --     col = "50%",
      --   },
      --   size = {
      --     width = 60,
      --     height = "auto",
      --   },
      -- },
      -- popupmenu = {
      --   relative = "editor",
      --   position = {
      --     row = 8,
      --     col = "50%",
      --   },
      --   size = {
      --     width = 60,
      --     height = 10,
      --   },
      --   border = {
      --     style = "rounded",
      --     padding = { 0, 1 },
      --   },
      --   win_options = {
      --     winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      --   },
      -- },
    },
  },
}
