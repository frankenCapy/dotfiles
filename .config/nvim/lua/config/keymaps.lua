-- Utility function for better key mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
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
map("i", "hh", "<Esc>", { silent = true })

-- Better window creation (your existing mappings)
map("n", "<C-A-h>", ":wincmd v<CR>:wincmd h<CR>", { silent = true })
map("n", "<C-A-j>", ":wincmd s<CR>", { silent = true })
map("n", "<C-A-k>", ":wincmd s<CR>:wincmd k<CR>", { silent = true })
map("n", "<C-A-l>", ":wincmd v<CR>", { silent = true })
map("n", "<C-A-Left>", ":wincmd v<CR>:wincmd h<CR>", { silent = true })
map("n", "<C-A-Down>", ":wincmd s<CR>", { silent = true })
map("n", "<C-A-Up>", ":wincmd s<CR>:wincmd k<CR>", { silent = true })
map("n", "<C-A-Right>", ":wincmd v<CR>", { silent = true })
map("n", "<C-A-x>", ":wincmd q<CR>", { silent = true })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", { silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Remove highlighting
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })

-- System clipboard integration
map("v", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<Leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<Leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- Center cursor on navigation
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Better paste without yanking
map("x", "p", [["_dP]], { desc = "paste without yanking" })

-- Stay in indent mode
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

-- Better search
map("n", "*", "*zzzv", { silent = true })
map("n", "#", "#zzzv", { silent = true })

-- Add undo break-points
map("i", ",", ",<c-g>u", { silent = true })
map("i", ".", ".<c-g>u", { silent = true })
map("i", ";", ";<c-g>u", { silent = true })

-- Better indenting
map("n", "<", "<<", { silent = true })
map("n", ">", ">>", { silent = true })

-- File tree toggle
map("n", "<leader>a", function() Snacks.explorer() end, { desc = "Toggle file tree" })
