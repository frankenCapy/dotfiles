local wk = require("which-key")

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    wk.register({
      s = {
        name = "search",
        s = { builtin.live_grep, "search globally" },
        u = { builtin.grep_string, "search globally under cursor" },
        r = { builtin.lsp_references, "search lsp references" },
        c = { builtin.lsp_code_actions, "search code actions" },
        f = { builtin.git_files, "search git files" },
        b = {
          function()
            builtin.buffers({
              sort_lastused = true,
              ignore_current_buffer = true
            })
          end,
          "search buffers"
        },
      },
      ff = { builtin.git_files, "search git files" },
      ["<leader>"] = {
        function()
          builtin.buffers({
            sort_lastused = true,
            ignore_current_buffer = true
          })
        end,
        "search buffers"
      },
    }, { prefix = "<leader>" })

    require('telescope').setup()
  end
}
