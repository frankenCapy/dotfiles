-- Utility function for better key mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Swap ; and : to enter commands without pressing shift
map("n", ";", ":")
map("n", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- Quickly return to normal mode
map("i", "hh", "<Esc>")

-- Better window creation (your existing mappings)
map("n", "<C-A-h>", ":wincmd v<CR>:wincmd h<CR>")
map("n", "<C-A-j>", ":wincmd s<CR>")
map("n", "<C-A-k>", ":wincmd s<CR>:wincmd k<CR>")
map("n", "<C-A-l>", ":wincmd v<CR>")
map("n", "<C-A-Left>", ":wincmd v<CR>:wincmd h<CR>")
map("n", "<C-A-Down>", ":wincmd s<CR>")
map("n", "<C-A-Up>", ":wincmd s<CR>:wincmd k<CR>")
map("n", "<C-A-Right>", ":wincmd v<CR>")
map("n", "<C-A-x>", ":wincmd q<CR>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Remove highlighting
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- System clipboard integration
map("v", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<Leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<Leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- Center cursor on navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste without yanking
map("x", "p", [["_dP]], { desc = "paste without yanking" })

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better search
map("n", "*", "*zzzv")
map("n", "#", "#zzzv")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Better indenting
map("n", "<", "<<")
map("n", ">", ">>")
