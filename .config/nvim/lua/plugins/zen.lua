local wk = require("which-key")

return {
  "folke/zen-mode.nvim",
  config = function()
    wk.add({
      { "<leader>z", ":lua require'zen-mode'.toggle{}<CR>", desc = "Zen Mode", icon = "🧘" },
    })

    require("zen-mode").setup({
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        tmux = { enabled = true },
        alacritty = { enabled = true, font = "20" },
      }
    })
  end
}
