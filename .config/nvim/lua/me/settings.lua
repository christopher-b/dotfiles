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

-- Use rg as default :grep engine
local function set_grepprg()
    local cmd = 'rg --vimgrep '
    if vim.o.ignorecase then
        if vim.o.smartcase then
            cmd = cmd .. '-S ' --smartcase
        else
            cmd = cmd .. '-i ' --ignore-case
        end
    end

    vim.o.grepprg = cmd
end
set_grepprg()
vim.o.grepformat = '%f:%l:%c:%m'
vim.api.nvim_create_autocmd('OptionSet', {
    group = vim.api.nvim_create_augroup('rg', { clear = true }),
    pattern = 'ignorecase,smartcase',
    callback = set_grepprg,
})
