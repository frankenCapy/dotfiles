local map = require("utils").map

map("n", "<C-A-x>", ":wincmd q<CR>")

-- Swap ; and : to enter commands without pressing shift
map("n", ";", ":")
map("n", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- Quickly return to normal mode
map("i", "hh", "<Esc>")

--- faster window creation
map("n", "<C-A-h>", ":wincmd v<CR>:wincmd h<CR>")
map("n", "<C-A-j>", ":wincmd s<CR>")
map("n", "<C-A-k>", ":wincmd s<CR>:wincmd k<CR>")
map("n", "<C-A-l>", ":wincmd v<CR>")
map("n", "<C-A-Left>", ":wincmd v<CR>:wincmd h<CR>")
map("n", "<C-A-Down>", ":wincmd s<CR>")
map("n", "<C-A-Up>", ":wincmd s<CR>:wincmd k<CR>")
map("n", "<C-A-Right>", ":wincmd v<CR>")

-- remove highlighting
map("n", "<Leader><BS>", ":noh<CR>")

--- copy paste to system clipboard
map("v", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>p", '"+p', { noremap = true })
map("n", "<Leader>P", '"+P', { noremap = true })

--- center on certain nav
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
