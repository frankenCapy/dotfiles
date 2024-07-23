local wk = require("which-key")

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    wk.add({
      {
        "<leader><leader>",
        function()
          builtin.buffers({
            sort_lastused = true,
            ignore_current_buffer = true
          })
        end,
        desc = "search buffers"
      },
      { "<leader>ff", builtin.git_files, desc = "search git files" },
      { "<leader>s",  group = "search", icon = "" },
      {
        "<leader>sb",
        function()
          builtin.buffers({
            sort_lastused = true,
            ignore_current_buffer = true
          })
        end,
        desc = "search buffers"
      },
      { "<leader>sf", builtin.git_files,      desc = "search git files" },
      { "<leader>sr", builtin.lsp_references, desc = "search lsp references" },
      { "<leader>ss", builtin.live_grep,      desc = "search globally" },
      { "<leader>su", builtin.grep_string,    desc = "search globally under cursor" },
    })
    require('telescope').setup()
  end
}
