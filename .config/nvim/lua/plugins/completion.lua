return {
  "saghen/blink.cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "rafamadriz/friendly-snippets",
    "mikavilpas/blink-ripgrep.nvim",
    -- "giuxtaposition/blink-cmp-copilot",
  },
  version = "*",
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
    },
    providers = {
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        opts = {
          max_filesize = "100K",
          search_casing = "--smart-case",
        },
        -- (optional) customize how the results are displayed. Many options
        -- are available - make sure your lua LSP is set up so you get
        -- autocompletion help
        transform_items = function(_, items)
          for _, item in ipairs(items) do
            -- example: append a description to easily distinguish rg results
            item.labelDetails = {
              description = "(rg)",
            }
          end
          return items
        end,
      },
    },
    keymap = { preset = "super-tab" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    -- experimental signature help support
    -- signature = { enabled = true }
  },
}
