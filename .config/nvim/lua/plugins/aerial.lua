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
    'folke/which-key.nvim',
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function(_, opts)
    local wk = require("which-key")
    opts.post_jump_cmd = "normal! ztzo"
    opts.nav = {
      autojump = true,
      keymaps = {
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["<Left>"] = "actions.left",
        ["<Right>"] = "actions.right",
        ["h"] = "actions.left",
        ["l"] = "actions.right",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
      }
    }
    require("aerial").setup(opts)
    wk.add({
      { "<localleader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    })
  end,
}
