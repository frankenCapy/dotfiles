return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    -- recommended mappings
    vim.keymap.set('n', '<C-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').resize_right)
    vim.keymap.set('n', '<C-Left>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<C-Down>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<C-Up>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<C-Right>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<A-Left>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<A-Down>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<A-Up>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<A-Right>', require('smart-splits').move_cursor_right)
    -- swapping buffers between windows
    vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

    require('smart-splits').setup({
      -- Ignored filetypes (only while resizing)
      ignored_filetypes = {
        'nofile',
        'quickfix',
        'prompt',
      },
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = { 'neo-tree' },
      -- the default number of lines/columns to resize by at a time
      default_amount = 3,
      -- whether to wrap to opposite side when cursor is at an edge
      -- e.g. by default, moving left at the left edge will jump
      -- to the rightmost window, and vice versa, same for up/down.
      at_edge = "wrap",
      -- when moving cursor between splits left or right,
      -- place the cursor on the same row of the *screen*
      -- regardless of line numbers. False by default.
      -- Can be overridden via function parameter, see Usage.
      move_cursor_same_row = false,
      -- whether the cursor should follow the buffer when swapping
      -- buffers by default; it can also be controlled by passing
      -- `{ move_cursor = true }` or `{ move_cursor = false }`
      -- when calling the Lua function.
      cursor_follows_swapped_bufs = false,
      -- resize mode options
      resize_mode = {
        -- key to exit persistent resize mode
        quit_key = '<ESC>',
        -- keys to use for moving in resize mode
        -- in order of left, down, up' right
        resize_keys = { 'h', 'j', 'k', 'l' },
        -- set to true to silence the notifications
        -- when entering/exiting persistent resize mode
        silent = false,
        -- must be functions, they will be executed when
        -- entering or exiting the resize mode
        hooks = {
          on_enter = nil,
          on_leave = nil,
        },
      },
      -- ignore these autocmd events (via :h eventignore) while processing
      -- smart-splits.nvim computations, which involve visiting different
      -- buffers and windows. These events will be ignored during processing,
      -- and un-ignored on completed. This only applies to resize events,
      -- not cursor movement events.
      ignored_events = {
        'BufEnter',
        'WinEnter',
      },
      -- enable or disable a multiplexer integration;
      -- automatically determined, unless explicitly disabled or set,
      -- by checking the $TERM_PROGRAM environment variable,
      -- and the $KITTY_LISTEN_ON environment variable for Kitty
      multiplexer_integration = nil,
      -- disable multiplexer navigation if current multiplexer pane is zoomed
      -- this functionality is only supported on tmux and Wezterm due to kitty
      -- not having a way to check if a pane is zoomed
      disable_multiplexer_nav_when_zoomed = true,
    })
  end
}
