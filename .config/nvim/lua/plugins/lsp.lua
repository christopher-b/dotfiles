-- One LSP config to rule them...
-- https://lsp-zero.netlify.app/v3.x/getting-started.html
return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      keys = {
        { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" }
      }
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.set_sign_icons({ error = " ", warn = " ", hint = "󰠠 ", info = " "}) -- Gutter icons

    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap -- for conciseness
    lsp_zero.on_attach(function(_client, bufnr)
      opts.buffer = bufnr

      -- https://lsp-zero.netlify.app/v3.x/language-server-configuration.html#default-keybindings
      lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false -- Overwrites existing keybindings
      })

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "cx", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Signature help"
      keymap.set("n", "cs", vim.lsp.buf.signature_help, opts) -- show documentation for what is under cursor

      -- Other maps:
      -- gd: go to definition

      -- opts.desc = "List references in Telescope"
      -- keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

      -- opts.desc = "Show LSP implementations"
      -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      -- opts.desc = "Show LSP type definitions"
      -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      -- opts.desc = "Smart rename"
      -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    end)

    -- Snippet library
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Autocomplete
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    cmp.setup({
      sources = {
        {name = "nvim_lsp"},
        {name = "buffer"},
        {name = "path"},
        {name = "luasnip"},
        {name = "nvim_lua"},
        {name = "nvim_lsp_signature_help"},
      },

      -- completion = {
      --   completeopt = "menu,menuone,preview,noselect",
      -- },

      --- Customize completion menu
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          }),
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      view = {
        entries = {name = "custom", selection_order = "near_cursor" }
      },
      -- formatting = {
      --   fields = {"abbr", "kind", "menu"},
      --   format = require("lspkind").cmp_format({
      --     mode = "symbol", -- show only symbol annotations
      --     maxwidth = 50, -- prevent the popup from showing more than provided characters
      --     ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      --   })
      -- },

      -- Custom keybindings
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = false}),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<S-Tab>"] = cmp_action.tab_complete(),
        -- ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
      }),

      snippet = {
        expand = function(args)
          local luasnip = require("luasnip")
          luasnip.lsp_expand(args.body)
          luasnip.filetype_extend("ruby", {"rails"})
        end,
      },
    })
    -- `/` cmdline setup.
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
      {
        {
          name = "path",
          option = { trailing_slash = true },
        }
      },
      {
        {
          name = "cmdline",
          option = {
            treat_trailing_slash = false
            -- ignore_cmds = { "Man", "!" }
          }
        }
      })
    })

    -- Mason config
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- MasonLSP config
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- "bashls",
        "dockerls",
        -- "eslint",
        "html",
        "intelephense",
        "lua_ls",
        "marksman",
        "quick_lint_js",
        -- "ruby_lsp",
        -- "standardrb",
        -- "stimulus_ls",
        "yamlls",
      },
      handlers = {
        -- Provide default handler for mason-lspconfig options
        lsp_zero.default_setup,

        -- Configure individual LS
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", },  -- make the language server recognize "vim" global
                },
                workspace = {
                  -- make language server aware of runtime files
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                  },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
