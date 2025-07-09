local wk = require("which-key")

return {
  'folke/trouble.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    wk.add({
      {
        "<leader>et",
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = "Diagnostics (Trouble)"
      },
      {
        "<leader>eb",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>el",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP (Trouble)",
      },
    })
    require("trouble").setup {}
  end
}
