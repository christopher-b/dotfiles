require("cbennell.settings")
require("cbennell.remap")
require("cbennell.autocmd")
require("cbennell.lazy")

-- require("cbennell.filter-diagnostics")
-- vim.lsp.enable("ruby_lsp")

-- require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } })
require("lazy").setup({
  spec = {
    { import = "plugins/colors" },
    -- { import = "plugins/completion" },
    { import = "plugins/formatting" },
    { import = "plugins/lint" },
    { import = "plugins/lsp" },
    { import = "plugins/lsp-ruby" },
    { import = "plugins/statusline" },
    { import = "plugins/noice" },
    -- { import = "plugins/nvim-notify" },
    { import = "plugins/nvim-tree" },
    { import = "plugins/nvim-treesitter" },
    { import = "plugins/nvim-treesitter-text-objects" },
    { import = "plugins/nvim-web-devicons" },
    { import = "plugins/snacks" }, -- Dashboard,
    { import = "plugins/telescope" },
    { import = "plugins/trouble" },
    { import = "plugins/vim-endwise" },
    { import = "plugins/vim-indent-object" },
    { import = "plugins/vim-surround" },
    { import = "plugins/vim-tmux-navigator" },
    { import = "plugins/which-key" }
  },
})
--[[
Follow up
https://github.com/tpope/vim-surround
https://github.com/tpope/vim-rails
https://github.com/Shougo/neosnippet.vim
https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019
https://gist.github.com/romainl/4b9f139d2a8694612b924322de1025ce
https://github.com/ctrlpvim/ctrlp.vim
https://github.com/preservim/tagbar
https://github.com/vim-ctrlspace/vim-ctrlspace
https://github.com/vim-ruby/vim-ruby
https://github.com/ryanoasis/vim-devicons
https://github.com/PhilRunninger/nerdtree-buffer-ops
https://github.com/jiangmiao/auto-pairs
https://learnvimscriptthehardway.stevelosh.com/
https://learnvim.irian.to/customize/vim_runtime
https://github.com/tpope/vim-ragtag/blob/master/doc/ragtag.txt
https://github.com/simrat39/symbols-outline.nvim
--]]
