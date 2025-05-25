return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- this adding nvim-treesitter
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-plenary"),
        require("neotest-rust") {
          args = { "--no-capture" },
        },
        -- require("neotest-go"),
        -- require("neotest-python"),
        require('neotest-jest'),
      },
    })
  end
}
