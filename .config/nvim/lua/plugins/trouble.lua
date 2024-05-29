local wk = require("which-key")

return {
  'folke/trouble.nvim',
  lazy = true,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    wk.register({
      e = { ':TroubleToggle<CR>', "Errors" },
    }, { prefix = "<leader>" })

    require("trouble").setup{}
  end
}
