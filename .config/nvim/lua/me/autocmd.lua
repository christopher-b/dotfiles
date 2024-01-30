local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local my_group = augroup("myGroup", { clear = true })

-- Strip whitespace
autocmd("BufWritePre", {
  group = my_group,
  pattern = {"*"},
  command = [[:%s/\s\+$//e]],
})

autocmd("InsertEnter", {
  group = my_group,
  command = ":set norelativenumber",
  desc = "Toggle relativenumber option when entering and leaving insert mode",
})
autocmd("InsertLeave", {
  group = my_group,
  command = ":set relativenumber",
  desc = "Toggle relativenumber option when entering and leaving insert mode",
})


autocmd({"VimEnter", "WinEnter", "BufWinEnter" }, {
  group = my_group,
  command = "setlocal cursorline",
  desc = "Cursor line only on active pane",
})
autocmd("WinLeave", {
  group = my_group,
  command = "setlocal nocursorline",
  desc = "Cursor line only on active pane",
})


-- autocmd("InsertLeave", {
--   group = mygroup,
--   desc = "Save a file when leaving insert, if writable",
--   callback = function()
--     local current_file_writable = vim.fn.filewritable(vim.fn.expand("%:p"))
--     local found_file = vim.fn.findfile(vim.fn.expand("%:t"), vim.fn.expand("%:h"))

--     if(current_file_writable or not found_file) then
--       vim.cmd("silent! w!")
--     end
--   end
-- })

