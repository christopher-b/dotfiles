-- Base config
require("cbennell.settings")
require("cbennell.remap")
require("cbennell.autocmd")
require("cbennell.lazy")

-- Experiments
-- require("cbennell.filter-diagnostics").filter("Standard Ruby")
-- vim.lsp.enable("ruby_lsp")
-- vim.lsp.set_log_level('trace')
-- vim.lsp.set_log_level('debug')
-- require('vim.lsp.log').set_format_func(vim.inspect)

-- Plugins
require("lazy").setup({
  spec = {
    { import = "plugins/avante" },
    { import = "plugins/aerial" },
    { import = "plugins/colors" },
    { import = "plugins/completion" },
    { import = "plugins/dap" },
    { import = "plugins/formatting" },
    { import = "plugins/lint" },
    { import = "plugins/lsp" },
    { import = "plugins/lsp-ruby" },
    { import = "plugins/statusline" },
    { import = "plugins/neogen" }, -- Doc annotations
    { import = "plugins/noice" }, -- UI
    { import = "plugins/nvim-tree" },
    { import = "plugins/nvim-treesitter" },
    { import = "plugins/nvim-treesitter-text-objects" },
    { import = "plugins/nvim-web-devicons" },
    { import = "plugins/snacks" }, -- Dashboard, indent lines, lazygit, scratch
    { import = "plugins/telescope" },
    { import = "plugins/tests" },
    { import = "plugins/trouble" }, -- Diagnostics
    { import = "plugins/vim-endwise" },
    { import = "plugins/vim-indent-object" },
    -- { import = "plugins/vim-rails" },
    { import = "plugins/vim-surround" },
    { import = "plugins/vim-tmux-navigator" },
    { import = "plugins/which-key" },

    { import = "plugins/bufferline" },
    { import = "plugins/mini-nvim" }, -- Pairs,
    { import = "plugins/smear" },

    -- { import = "plugins/startuptime" },
    -- { import = "plugins/vim-rspec" },
    -- { import = "plugins/dap" },
    -- https://github.com/folke/flash.nvim
    -- https://github.com/ThePrimeagen/refactoring.nvim
    -- https://github.com/nvim-neotest/neotest
  },
})
