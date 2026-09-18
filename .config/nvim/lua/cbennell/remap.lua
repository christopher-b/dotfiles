vim.g.mapleader = " "

-- Save left hand travel
vim.keymap.set("i", "jk", "<esc> :w<CR>")

-- Terminal escape insert mode
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- vim.keymap.set("t", " jk <C-\><C-n>

-- [[ Files / Buffers ]]
-- Save buffer
vim.keymap.set("n", "<Leader>s", "<cmd>write<CR>", { desc = "Save current buffer" })

-- New file
vim.keymap.set("n", "<Leader>n", ":enew<CR>")
-- Close current buffer without messing up tabs
vim.keymap.set("n", "<Leader>w", ":bp|bd #<CR>")
vim.keymap.set("n", "<Leader>W", ":tabclose<CR>")

-- [[ Navigation ]]
-- Ctrl-u and -d keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Buffer navigation
-- These mimic keys used for switching browser tabs
vim.keymap.set("n", "<M-D-Right>", "<Esc>:bnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-D-Left>", "<Esc>:bprevious<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<A-M-Right>", "<Esc>:bnext<cr>")
-- vim.keymap.set("n", "<A-M-Left>", "<Esc>:bprevious<cr>")

-- Tab navigation
vim.keymap.set("n", "<Leader><tab>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<Leader><s-tab>", "<cmd>tabprev<cr>")

-- Resize windows with option+hjkl
vim.keymap.set("n", "<C-M-h>", ":vertical resize -4<CR>", { desc = "Shrink window left" })
vim.keymap.set("n", "<C-M-l>", ":vertical resize +4<CR>", { desc = "Grow window right" })
vim.keymap.set("n", "<C-M-j>", ":resize -4<CR>", { desc = "Shrink window down" })
vim.keymap.set("n", "<C-M-k>", ":resize +4<CR>", { desc = "Grow window up" })

-- Quickfix list
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list" })
vim.keymap.set("n", "<leader>l", "<cmd>lprev<CR>zz", { desc = "Prev location list" })

--[[ Editing ]]
-- Paste without losing buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Search/replace current word
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Yank to system
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
-- vim.keymap.set("n", "<leader>Y", [["*Y]])

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Duplicate line up / down
vim.keymap.set("n", "<A-down>", "yyp")
vim.keymap.set("n", "<A-up>", "yykp")

-- Insert a line below current line
vim.keymap.set({ "i", "n" }, "<A-CR>", "<ESC>o")

-- Join, but keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- Comments
vim.keymap.set("n", "<Leader>/", "gcc", {remap=true, desc="Toggle comment"})
vim.keymap.set("v", "<Leader>/", "gc")

-- Search escape highlight
vim.keymap.set("n", "mm", ":noh<CR>")

