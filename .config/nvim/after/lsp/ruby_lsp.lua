return {
  cmd = { "ruby-lsp" },
  -- cmd = { "ruby-lsp", "--debug" },
  -- cmd = { "mise", "x", "--", "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = {
    "Gemfile.lock",
    "Gemfile",
    ".ruby-version",
  },
  -- settings = {
  --   capabilities: {
  --   },
  -- },
  init_options = {
    formatter = "standard",
    linters = { "standard" },
  },
}
