return {
  "tpope/vim-commentary",
  keys = {
    { "<leader>/", "<Plug>CommentaryLine" },
    { "<leader>/", "<Plug>Commentary", mode = "x" },
    { "<leader>?", "<Plug>Commentary" },

    --[[
    From source
    " Visual mode
    xmap gc <Plug>Commentary
    " Normal mode
    nmap gc <Plug>Commentary
    " Normal mode, current line
    nmap gcc <Plug>CommentaryLine
    " Operator pending mode (this lets you do e.g. `dgc` to delete a block of comments)
    omap gc <Plug>Commentary
    " Special case cgc (you can skip this one, but then `cgc` will also delete an extra blank line)
    nmap cgc <Plug>ChangeCommentary

    xmap gc  <Plug>Commentary
    nmap gc  <Plug>Commentary
    omap gc  <Plug>Commentary
    nmap gcc <Plug>CommentaryLine
    nmap gcu <Plug>Commentary<Plug>Commentary
    --]]

    --[[
    Original
    map <M-/> gcc
    imap <M-/> <C-o>gcc
    --]]
  },
}
