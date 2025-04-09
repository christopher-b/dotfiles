return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    -- { "<leader>xx", function() require("trouble").toggle() end,                        desc = "Toggle Trouble" },
    -- { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Workspace diagnostics" },
    -- { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,  desc = "Document diagnostics" },
    -- { "<leader>xq", function() require("trouble").toggle("quickfix") end,              desc = "Quickfix" },
    -- { "<leader>xl", function() require("trouble").toggle("loclist") end,               desc = "Location list" },
    -- { "gR",         function() require("trouble").toggle("lsp_references") end,        desc = "Trouble LSP references" },
  },
}
