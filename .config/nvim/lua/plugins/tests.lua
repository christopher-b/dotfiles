return {
  "nvim-neotest/neotest",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters
    "zidhuss/neotest-minitest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-minitest")({
          test_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rails",
              "test",
            })
          end,
        }),
      },
    })
  end,
  keys = {
    -- { "<leader>t", group = "🧪 Test", nowait = true, remap = false },
    { "<leader>t", "", desc = "+test" },
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File (Neotest)",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run All Test Files (Neotest)",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest (Neotest)",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last (Neotest)",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary (Neotest)",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Show Output (Neotest)",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel (Neotest)",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop (Neotest)",
    },
    {
      "<leader>tw",
      function()
        require("neotest").watch.toggle(vim.fn.expand("%"))
      end,
      desc = "Toggle Watch (Neotest)",
    },

    -- { "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test" },
    -- { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run current file" },
    -- { "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>", desc = "Run all tests" },
    -- { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug nearest test" },
    -- { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop test" },
    -- { "<leader>tn", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach to nearest test" },
    -- { "<leader>to", "<cmd>lua require('neotest').output.open()<cr>", desc = "Show test output" },
    -- { "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle output panel" },
    -- { "<leader>tv", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle summary" },
    -- {
    --   "<leader>tc",
    --   "<cmd>lua require('neotest').run.run({ suite = true, env = { CI = true } })<cr>",
    --   desc = "Run all tests with CI",
    -- },
  },

  -- opts = {
  --   adapters = {
  --     require("neotest-minitest")({
  --       -- dap = { justMyCode = false },
  --       test_cmd = function()
  --         return vim.tbl_flatten({
  --           "bundle",
  --           "exec",
  --           "rails",
  --           "test",
  --         })
  --       end,
  --     }),
  --     -- require("neotest-plenary"),
  --     -- require("neotest-vim-test")({
  --     --   ignore_file_types = { "python", "vim", "lua" },
  --     -- }),
  --   },
  -- },
}
