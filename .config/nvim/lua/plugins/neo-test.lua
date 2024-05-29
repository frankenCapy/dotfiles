local wk = require("which-key")
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-plenary",
  },
  config = function()
    -- wk.register({
    --   r = { require("neotest").run.run(), "test nearest" },
    -- }, { prefix = "<leader>r" })
    require("neotest").setup({
      adapters = {
        require("neotest-plenary"),
        -- require("neotest-vim-test")({
        --   ignore_file_types = { "python", "vim", "lua" },
        -- }),
        require("neotest-rust") {
          args = { "--no-capture" },
        },
        require("neotest-go"),
      },
    })
  end
}
-- return {
--   'klen/nvim-test',
--   config = function()
--     wk.register({
--       r = { ":TestNearest<CR>", "test nearest" },
--       tn = { ":TestNearest<CR>", "test nearest" },
--       tf = { ":TestFile<CR>", "test file" },
--       te = { ":TestEdit<CR>", "test edit" },
--       ta = { ":TestSuite<CR>", "test all suite" },
--     }, { prefix = "<leader>r" })
--
--     require('nvim-test').setup {
--       run = true,               -- run tests (using for debug)
--       commands_create = true,   -- create commands (TestFile, TestLast, ...)
--       filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
--       silent = false,           -- less notifications
--       term = "terminal",        -- a terminal to run ("terminal"|"toggleterm")
--       termOpts = {
--         direction = "float",    -- terminal's direction ("horizontal"|"vertical"|"float")
--         width = 180,            -- terminal's width (for vertical|float)
--         height = 80,            -- terminal's height (for horizontal|float)
--         go_back = false,        -- return focus to original window after executing
--         stopinsert = "auto",    -- exit from insert mode (true|false|"auto")
--         keep_one = true,        -- keep only one terminal for testing
--       },
--       runners = {
--         -- setup tests runners
--         cs = "nvim-test.runners.dotnet",
--         go = "nvim-test.runners.go-test",
--         haskell = "nvim-test.runners.hspec",
--         javacriptreact = "nvim-test.runners.jest",
--         javascript = "nvim-test.runners.jest",
--         lua = "nvim-test.runners.busted",
--         python = "nvim-test.runners.pytest",
--         ruby = "nvim-test.runners.rspec",
--         rust = "nvim-test.runners.cargo-test",
--         typescript = "nvim-test.runners.jest",
--         typescriptreact = "nvim-test.runners.jest",
--       }
--     }
--   end
-- }
