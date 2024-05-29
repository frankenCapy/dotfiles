return {
  'ray-x/lsp_signature.nvim',
  {
    'neovim/nvim-lspconfig',
    config = function() require('lsp/init') end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'nvim-lua/lsp-status.nvim',
      'cmp-nvim-lsp'
    }
  },
}
