return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },

    { "<c-h>",  "<C-\\><C-n>:TmuxNavigateLeft<cr>", mode = "t" },
    { "<c-j>",  "<C-\\><C-n>:TmuxNavigateDown<cr>", mode = "t" },
    { "<c-k>",  "<C-\\><C-n>:TmuxNavigateUp<cr>", mode = "t" },
    { "<c-l>",  "<C-\\><C-n>:TmuxNavigateRight<cr>", mode = "t" },
    { "<c-\\>", "<C-\\><C-n>:TmuxNavigatePrevious<cr>", mode = "t" },
  },
}
