local wk = require("which-key")

return {
  'nvim-telescope/telescope.nvim',
  event = "VimEnter",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
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
      { "<leader>s", group = "search", icon = "" },
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
      { "<leader>so", builtin.vim_options,    desc = "list vim options" },
    })
    require('telescope').setup({
      pickers = {
        live_grep = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          additional_args = function(_)
            return { "--hidden" }
          end
        },
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          hidden = true
        }
      },
    })
  end
}
