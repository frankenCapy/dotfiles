return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },
  ft = { 'markdown' },
  config = function()
    require('render-markdown').setup({
      render_modes = { 'n', 'c', 't', 'V' },
      nested = false,
      heading = {
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
      code = {
        enabled = true,
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      dash = {
        icon = '─',
        width = 'full',
      },
      bullet = {
        icons = { '●', '○', '◆', '◇' },
      },
      anti_conceal = {
        enabled = false,
      },

    })
  end,
}
