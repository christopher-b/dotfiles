return {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = {
    "Gemfile.lock",
    "Gemfile",
    ".ruby-version",
  },
  init_options = {
    formatter = "standard",
    linters = { "standard" },
  },
}
