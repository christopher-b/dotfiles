return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        automatic_installation = false,
        ensure_installed = {
          "lua_ls",
          -- "bashls",
          -- "dockerls",
          -- "eslint",
          -- "html",
          -- "intelephense",
          -- "marksman",
          -- "quick_lint_js",
          -- "stimulus_ls",
          -- "yamlls",
        },
      },
    },
    {
      -- Must come after mason-lspconfig, so that this is evaluated first
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    {
      "folke/lazydev.nvim", -- Better lua_ls config for editing neovim config
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          {
            path = "${3rd}/luv/library",
            words = { "vim%.uv" },
          },
        },
      },
    },
  },
  init = function()
    -- Automatically set up LSP severs installed by Mason
    -- require("mason-lspconfig").setup_handlers({
    --   -- Default handler
    --   function(server_name)
    --     -- Blink adds additional capabilities that we report to the LSP
    --     local capabilities = require("blink.cmp").get_lsp_capabilities()
    --     vim.lsp.config(server_name, { capabilities = capabilities })
    --     vim.lsp.enable(server_name)
    --     -- require("lspconfig")[server_name].setup({ capabilities = capabilities })
    --   end,
    --
    --   -- Handler overrides for specific setup. Ex:
    --   -- ["rust_analyzer"] = function()
    --   --   require("rust-tools").setup {}
    --   -- end
    -- })

    -- We currently have conform doing format-on-save
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     if not client then return end
    --     -- Format the current buffer on save
    --     if client:supports_method("textDocument/formatting") then
    --       vim.api.nvim_create_autocmd("BufWritePre", {
    --         buffer = args.buf,
    --         callback = function()
    --           vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
    --         end,
    --       })
    --     end
    --   end,
    -- })

    -- Gutter icons
    local severity = vim.diagnostic.severity
    vim.diagnostic.config({
      signs = {
        text = {
          [severity.ERROR] = " ",
          [severity.WARN] = " ",
          [severity.INFO] = " ",
          [severity.HINT] = " 󰌵",
        },
      },
    })
  end,
}
