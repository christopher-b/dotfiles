return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

     -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "bashls",
        -- "cssls",
        -- "docker_compose_language_service",
        "dockerls",
        -- "emmet_ls",
        -- "eslint",
        "html",
        "intelephense",
        -- "jsonls",
        "lua_ls",
        "marksman",
        "quick_lint_js",
        -- "solargraph",
        "ruby_lsp",
        "standardrb",
        "stimulus_ls",
        "yamlls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
  end
}
