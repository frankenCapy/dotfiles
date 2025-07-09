local M = {}

-- Store original values
local original_options = {}
local focus_mode_active = false

function M.toggle()
  if focus_mode_active then
    M.disable()
  else
    M.enable()
  end
end

function M.enable()
  if focus_mode_active then return end
  
  -- Store original option values
  original_options = {
    signcolumn = vim.opt.signcolumn:get(),
    number = vim.opt.number:get(),
    relativenumber = vim.opt.relativenumber:get(),
    cursorline = vim.opt.cursorline:get(),
    list = vim.opt.list:get(),
    colorcolumn = vim.opt.colorcolumn:get(),
    statusline = vim.opt.statusline:get(),
    laststatus = vim.opt.laststatus:get(),
    showtabline = vim.opt.showtabline:get(),
    wrap = vim.opt.wrap:get(),
    textwidth = vim.opt.textwidth:get(),
    linebreak = vim.opt.linebreak:get(),
    winwidth = vim.api.nvim_get_option_value('winwidth', {}),
  }
  
  -- Apply focus mode settings
  vim.opt.signcolumn = "no"
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.cursorline = false
  vim.opt.list = false
  vim.opt.colorcolumn = ""
  vim.opt.laststatus = 0
  vim.opt.showtabline = 0
  vim.opt.wrap = true
  vim.opt.linebreak = true
  
  -- Hide all other windows first
  vim.cmd("only")
  
  -- Center the buffer by creating side windows
  local width = vim.o.columns
  local height = vim.o.lines
  local center_width = math.min(120, math.floor(width * 0.8)) -- Max 120 chars or 80% of screen
  local side_width = math.max(1, math.floor((width - center_width) / 2))
  
  -- Create left side window
  vim.cmd("topleft vertical new")
  vim.api.nvim_win_set_width(0, side_width)
  vim.opt_local.winfixwidth = true
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.signcolumn = "no"
  vim.opt_local.statusline = " "
  -- Make it empty and non-modifiable
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
  vim.opt_local.buftype = "nofile"
  vim.opt_local.buflisted = false
  vim.opt_local.swapfile = false
  vim.opt_local.modifiable = false
  
  -- Go back to the main window
  vim.cmd("wincmd l")
  
  -- Create right side window
  vim.cmd("botright vertical new")
  vim.api.nvim_win_set_width(0, side_width)
  vim.opt_local.winfixwidth = true
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.signcolumn = "no"
  vim.opt_local.statusline = " "
  -- Make it empty and non-modifiable
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
  vim.opt_local.buftype = "nofile"
  vim.opt_local.buflisted = false
  vim.opt_local.swapfile = false
  vim.opt_local.modifiable = false
  
  -- Return to center window
  vim.cmd("wincmd h")
  
  focus_mode_active = true
  vim.notify("Focus mode enabled", "info", { title = "Focus Mode" })
end

function M.disable()
  if not focus_mode_active then return end
  
  -- Close all windows and return to single window layout
  vim.cmd("only")
  
  -- Restore original options
  for option, value in pairs(original_options) do
    if option == "winwidth" then
      -- Skip winwidth as it's not a vim.opt option
    else
      vim.opt[option] = value
    end
  end
  
  focus_mode_active = false
  vim.notify("Focus mode disabled", "info", { title = "Focus Mode" })
end

function M.is_active()
  return focus_mode_active
end

return M