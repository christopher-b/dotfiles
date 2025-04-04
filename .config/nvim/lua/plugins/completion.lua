return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    -- "giuxtaposition/blink-cmp-copilot",
  },
  -- version = 'v0.*',
  version = "v0.7",
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = { preset = "default" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono"
    },

    -- experimental signature help support
    signature = { enabled = true }
  },
  -- opts_extend = { "sources.default" }
}
