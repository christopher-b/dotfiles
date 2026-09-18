local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local group = augroup("cbennell_autocmd", { clear = true })

-- Strip whitespace before save
autocmd("BufWritePre", {
  group = group,
  pattern = { "*" },
  command = [[:%s/\s\+$//e]],
})

-- Switch line numbering in normal/insert
autocmd("InsertEnter", {
  group = group,
  command = ":set norelativenumber",
  desc = "Toggle relativenumber option when entering and leaving insert mode",
})
autocmd("InsertLeave", {
  group = group,
  command = ":set relativenumber",
  desc = "Toggle relativenumber option when entering and leaving insert mode",
})

autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = group,
  command = "setlocal cursorline",
  desc = "Cursor line only on active pane",
})
autocmd("WinLeave", {
  group = group,
  command = "setlocal nocursorline",
  desc = "Cursor line only on active pane",
})

