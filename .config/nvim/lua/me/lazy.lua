local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } })
require("lazy").setup({
  spec = {
    { import = "plugins/colors" },
    { import = "plugins/completion" },
    { import = "plugins/formatting" },
    -- { import = "plugins/lint" },
    { import = "plugins/lsp" },
    { import = "plugins/lsp-ruby" },
    { import = "plugins/statusline" },
    { import = "plugins/noice" },
    -- { import = "plugins/nvim-notify" },
    { import = "plugins/nvim-tree" },
    { import = "plugins/nvim-treesitter" },
    { import = "plugins/nvim-treesitter-text-objects" },
    { import = "plugins/nvim-web-devicons" },
    { import = "plugins/snacks" }, -- Dashboard
    { import = "plugins/telescope" },
    { import = "plugins/trouble" },
    { import = "plugins/vim-endwise" },
    { import = "plugins/vim-indent-object" },
    { import = "plugins/vim-surround" },
    { import = "plugins/vim-tmux-navigator" },
    { import = "plugins/which-key" }
    -- { import = "plugins/aerial" },
    -- { import = "plugins/ai"},
    -- { import = "plugins/avante"},
    -- { import = "plugins/colorize" },
    -- { import = "plugins/colorscheme" },
    -- { import = "plugins/dressing" },
    -- { import = "plugins/harpoon" },
    -- { import = "plugins/lazygit" },
    -- { import = "plugins/mini-nvim" },
    -- { import = "plugins/nvim-devdocs" },
    -- { import = "plugins/nvim-treesitter-context" },
    -- { import = "plugins/terminal" },
    -- { import = "plugins/undotree" },
  },
})
