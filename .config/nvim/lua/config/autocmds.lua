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

-- Auto-reload files changed outside of vim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  desc = 'Auto reload files changed outside of vim',
  group = vim.api.nvim_create_augroup('auto-reload', { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end
})

-- Custom markdown fold expression - only fold H1 and H2
_G.markdown_fold_expr = function()
  local line = vim.fn.getline(vim.v.lnum)
  local next_line = vim.fn.getline(vim.v.lnum + 1)

  -- Check for # style headers (only H1 and H2)
  local h1 = line:match("^#%s")
  local h2 = line:match("^##%s")

  if h1 then
    return ">1"
  elseif h2 then
    return ">2"
  end

  -- Check for === (H1) or --- (H2) style headers
  if next_line:match("^===+%s*$") then
    return ">1"
  elseif next_line:match("^---+%s*$") then
    return ">2"
  end

  -- For all other lines, maintain the fold level
  return "="
end

-- Markdown folding configuration
vim.api.nvim_create_autocmd("FileType", {
  desc = 'Configure markdown folding',
  group = vim.api.nvim_create_augroup('markdown-folding', { clear = true }),
  pattern = "markdown",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.markdown_fold_expr()"
    vim.opt_local.foldlevel = 99    -- Start with all folds open
    vim.opt_local.foldenable = true -- Enable folds for markdown
  end,
})
