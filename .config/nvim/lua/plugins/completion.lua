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
      default = { "lsp", "path", "snippets", "buffer" },
    },
    -- sources = {
    --   default = {
    --     "buffer",
    --     -- "ripgrep", -- 👈🏻 add "ripgrep" here
    --   },
    -- },
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    -- keymap = { preset = "super-tab" },
    keymap = { preset = "enter" },

    appearance = {

      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    -- experimental signature help support
    -- signature = { enabled = true }
  },
  -- config = function(_, opts)
  --   local lspconfig = require("lspconfig")
  --   for server, config in pairs(opts.servers) do
  --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
  --     -- `opts[server].capabilities, if you've defined it
  --     config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
  --     lspconfig[server].setup(config)
  --   end
  -- end,
  -- opts_extend = { "sources.default" },
}
