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

-- Smart fold toggle that works from anywhere in fold
_G.toggle_fold_smart = function()
  local line = vim.fn.line('.')
  -- Check if current line is in a closed fold
  local fold_closed = vim.fn.foldclosed(line)

  if fold_closed ~= -1 then
    -- We're in a closed fold, open it
    vim.cmd('normal! zo')
  else
    -- We're in an open fold or on a fold line, close it
    -- Use zc to close the fold containing the cursor
    vim.cmd('normal! zc')
  end
end

-- Smart gx handler for markdown files
_G.open_link_smart = function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  -- Try to find markdown link [text](path)
  local link_pattern = "%[.-%]%((.-)%)"
  for link in line:gmatch(link_pattern) do
    local start_pos = line:find("%[.-%]%(" .. vim.pesc(link) .. "%)")
    if start_pos and col >= start_pos - 1 then
      -- Check if it's a URL (http/https) - always open in browser
      if link:match("^https?://") then
        vim.ui.open(link)
        return
      end

      -- Check if it's a local markdown file
      if link:match("%.md$") or link:match("%.md#") then
        -- Remove any anchor links
        local file_path = link:gsub("#.*$", "")

        -- Handle relative paths
        if not file_path:match("^/") and not file_path:match("^~") then
          local current_file = vim.fn.expand("%:p:h")
          file_path = current_file .. "/" .. file_path
        end

        -- Expand ~ to home directory
        file_path = vim.fn.expand(file_path)

        -- Open in current window
        vim.cmd("edit " .. vim.fn.fnameescape(file_path))
        return
      else
        -- For other non-markdown links, use system handler
        vim.ui.open(link)
        return
      end
    end
  end

  -- Fallback to default gx behavior for URLs
  local url_pattern = "https?://[%w-_%.%?%.:/%+=&@]+"
  local url = line:match(url_pattern)
  if url then
    vim.ui.open(url)
  end
end

-- Presentation mode toggle - makes cursorline highly visible with color cycling
_G.presentation_mode = false
_G.presentation_color_index = 1
_G.presentation_colors = {
  { name = "Red", bg = "#5e3a3a", fg = "#f38ba8" },
  { name = "Green", bg = "#3a5e3a", fg = "#a6e3a1" },
  { name = "Blue", bg = "#3a4a5e", fg = "#89b4fa" },
  { name = "Yellow", bg = "#5e5a3a", fg = "#f9e2af" },
  { name = "Purple", bg = "#4e3a5e", fg = "#cba6f7" },
  { name = "Teal", bg = "#3a5e57", fg = "#94e2d5" },
  { name = "Peach", bg = "#5e4a3a", fg = "#fab387" },
  { name = "Pink", bg = "#5e3a52", fg = "#f5c2e7" },
}

_G.apply_presentation_highlight = function()
  if _G.presentation_mode then
    local color = _G.presentation_colors[_G.presentation_color_index]
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, 'CursorLine', {
      bg = color.bg,
      bold = true,
    })
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      fg = color.fg,
      bg = color.bg,
      bold = true,
    })
  end
end

_G.toggle_presentation_mode = function()
  _G.presentation_mode = not _G.presentation_mode

  if _G.presentation_mode then
    _G.apply_presentation_highlight()
    local color = _G.presentation_colors[_G.presentation_color_index]
    print("Presentation mode: ON (" .. color.name .. ")")
  else
    -- Reset to default subtle cursorline
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, 'CursorLine', {
      bg = '#313244',  -- Subtle surface0 from Catppuccin Mocha
    })
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      fg = '#cdd6f4',  -- Default text color
      bg = '#313244',
    })
    print("Presentation mode: OFF")
  end
end

_G.cycle_presentation_color = function()
  if not _G.presentation_mode then
    print("Enable presentation mode first (press p)")
    return
  end

  _G.presentation_color_index = _G.presentation_color_index % #_G.presentation_colors + 1
  _G.apply_presentation_highlight()
  local color = _G.presentation_colors[_G.presentation_color_index]
  print("Presentation color: " .. color.name)
end

-- Markdown-specific fold keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Override za to work from anywhere in fold
    map('n', 'za', '<cmd>lua toggle_fold_smart()<CR>', { buffer = true, desc = "Toggle fold at cursor" })
    map('n', 'zR', 'zR', { buffer = true, desc = "Open all folds" })
    map('n', 'zM', 'zM', { buffer = true, desc = "Close all folds" })

    -- Override gx to open markdown files in Neovim
    map('n', 'gx', '<cmd>lua open_link_smart()<CR>', { buffer = true, desc = "Open link under cursor" })
  end,
})
