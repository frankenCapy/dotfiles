local wk = require("which-key")

return {
  "folke/zen-mode.nvim",
  config = function()
    wk.add({
      { "<leader>z", ":lua require'zen-mode'.toggle{}<CR>", desc = "Zen Mode", icon = "🧘" },
    })
  end
}
