return {
  "echasnovski/mini.indentscope",
  config = function()
    local is = require("mini.indentscope")
    is.setup({
      draw = {
        animation = is.gen_animation.none(),
        delay = 0,
      },
      options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = 'both',
        -- Whether to use cursor column when computing reference indent.
        indent_at_cursor = false,
        -- Whether to first check input line to be a border of adjacent scope.
        try_as_border = false,
      },
      symbol = '|',
    })
    -- disable indentscope in for neotree buffers
    vim.cmd("autocmd Filetype neo-tree lua vim.b.miniindentscope_disable = true")
  end
}
