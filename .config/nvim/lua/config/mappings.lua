-- Swap ; and : to enter commands without pressing shift
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("v", ";", ":")
vim.keymap.set("v", ":", ";")

-- Quickly return to normal mode
vim.keymap.set("i", "hh", "<Esc>")

--- faster window creation
vim.keymap.set("n", "<C-A-h>", ":wincmd v<CR>:wincmd h<CR>")
vim.keymap.set("n", "<C-A-j>", ":wincmd s<CR>")
vim.keymap.set("n", "<C-A-k>", ":wincmd s<CR>:wincmd k<CR>")
vim.keymap.set("n", "<C-A-l>", ":wincmd v<CR>")
vim.keymap.set("n", "<C-A-Left>", ":wincmd v<CR>:wincmd h<CR>")
vim.keymap.set("n", "<C-A-Down>", ":wincmd s<CR>")
vim.keymap.set("n", "<C-A-Up>", ":wincmd s<CR>:wincmd k<CR>")
vim.keymap.set("n", "<C-A-Right>", ":wincmd v<CR>")

--- close window
vim.keymap.set("n", "<C-A-x>", ":wincmd q<CR>")

-- remove highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--- copy paste to system clipboard
vim.keymap.set("v", "<Leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<Leader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<Leader>P", '"+P', { noremap = true })

--- center on certain nav
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

--- paste without yank
vim.keymap.set("x", "p", [["_dP]], { desc = "paste without yanking" })

--- stay in indent mode in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })
