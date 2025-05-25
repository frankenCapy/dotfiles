local wk = require("which-key")

return {
  'stevearc/aerial.nvim',
  opts = {
    layout = {
      default_direction = 'prefer_left',
    },
    on_attach = function(bufnr)
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function(_, opts)
    require("aerial").setup(opts)
    wk.add({
      { "<leader>ca", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    })
  end,
}

