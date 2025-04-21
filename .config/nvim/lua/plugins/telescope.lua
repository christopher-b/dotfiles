-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {
    file_ignore_patterns = { "node_modules", "db/fixtures" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-a>"] = actions.select_all,
            ["<esc>"] = actions.close,
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
  keys = {
    {
      "<leader>o",
      function()
        if 1 == vim.fn.isdirectory(".git") then
          vim.cmd("Telescope git_files")
        else
          vim.cmd("Telescope find_files")
        end
      end,
      desc = "Open file (telescope)",
    },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>" },
    { "<leader>fh", "<cmd>Telescope search_history<cr>" },
    { "<leader>b", "<cmd>Telescope buffers<cr>" },
    { "<leader>f?", "<cmd>Telescope help_tags<cr>" },
    -- quickfix, loclist, current_buffer_fuzzy_find
    -- lsp_references, lsp_incoming_calls, lsp_outgoing_calls, lsp_document_symbols, lsp_workspace_symbols, lsp_dynamic_workspace_symbols
  },
}
