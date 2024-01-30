-- Indent
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
-- vim.o.smartindent = true

-- Display
vim.o.showmode = false
vim.o.lcs = "tab:▸ ,trail:·"
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"
vim.o.title = true
vim.cmd("highlight clear SignColumn")

-- Behaviour
vim.o.ignorecase = true
vim.o.scrolloff = 5
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.undodir = os.getenv("HOME") .. ".vim/undodir"
