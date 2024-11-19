local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
    -- { import = "plugins/aerial" },
    { import = "plugins/ai"},
    -- { import = "plugins/avante"},
    -- { import = "plugins/colorize" },
    -- { import = "plugins/colorscheme" },
    { import = "plugins/color-nightfox" },
    { import = "plugins/dressing" },
    { import = "plugins/formatting" },
    { import = "plugins/harpoon" },
    { import = "plugins/lazygit" },
    { import = "plugins/linters" },
    { import = "plugins/lsp" },
    { import = "plugins/lualine" },
    -- { import = "plugins/mini-nvim" },
    { import = "plugins/noice" },
    -- { import = "plugins/nvim-devdocs" },
    { import = "plugins/nvim-notify" },
    { import = "plugins/nvim-tree" },
    { import = "plugins/nvim-treesitter-context" },
    { import = "plugins/nvim-treesitter-text-objects" },
    { import = "plugins/nvim-treesitter" },
    { import = "plugins/nvim-web-devicons" },
    { import = "plugins/telescope" },
    { import = "plugins/trouble" },
    -- { import = "plugins/undotree" },
    { import = "plugins/vim-endwise" },
    { import = "plugins/vim-surround" },
    { import = "plugins/vim-tmux-navigator" },
    { import = "plugins/which-key" },
  },
})
