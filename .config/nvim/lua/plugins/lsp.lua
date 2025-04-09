return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim", -- Better lua_ls config for editing neovim config
      ft = "lua",           -- only load on lua files
      opts = {
        library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, },
      },
    },
  },
  config = function()
    require("mason").setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    require("mason-lspconfig").setup {
      automatic_installation = false,
      ensure_installed = { "lua_ls" }
      -- "bashls",
      -- "dockerls",
      -- "eslint",
      -- "html",
      -- "intelephense",
      -- "lua_ls",
      -- "marksman",
      -- "quick_lint_js",
      -- "ruby_lsp",
      -- "standardrb",
      -- "stimulus_ls",
      -- "yamlls",
    }

    -- Automatically set up LSP severs installed by Mason
    require("mason-lspconfig").setup_handlers {
      function(server_name) -- Default handler
        -- config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
        require("lspconfig")[server_name].setup { capabilities = blink_capabilities }
      end,

      -- Handler overrides for specific setup. Ex:
      -- ["rust_analyzer"] = function()
      --   require("rust-tools").setup {}
      -- end
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        -- Format the current buffer on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end
      end
    })

    -- Gutter icons
    local signs = {
      { name = "DiagnosticSignError", text = " " }, -- You can use any icon/text
      { name = "DiagnosticSignWarn", text = " " },
      { name = "DiagnosticSignInfo", text = " " },
      { name = "DiagnosticSignHint", text = "󰌵 " },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = sign.name
      })
    end
    -- vim.cmd([[
    --   highlight DiagnosticSignError guifg=#db4b4b
    --   highlight DiagnosticSignWarn guifg=#e0af68
    --   highlight DiagnosticSignInfo guifg=#0db9d7
    --   highlight DiagnosticSignHint guifg=#10B981
    -- ]])
  end
}
