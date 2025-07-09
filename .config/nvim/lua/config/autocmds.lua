-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace',
  group = vim.api.nvim_create_augroup('trim-whitespace', { clear = true }),
  callback = function()
    -- Save cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    
    -- Remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
    
    -- Remove trailing empty lines
    vim.cmd([[%s/\n\+\%$//e]])
    
    -- Restore cursor position
    pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
  end,
})

