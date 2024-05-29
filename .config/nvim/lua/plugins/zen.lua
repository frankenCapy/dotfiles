local wk = require("which-key")

return {
  "folke/zen-mode.nvim",
  config = function()
    wk.register({
      z = { ":lua require'zen-mode'.toggle{}<CR>", "Zen Mode" },
    }, { prefix = "<leader>" })
  end

}
