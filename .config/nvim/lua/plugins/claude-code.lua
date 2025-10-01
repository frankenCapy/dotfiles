local toggle_key = "<M-,>" -- Alt/Meta + comma

return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      split_width_percentage = 0.4,
      split_side = "bottom",
      snacks_win_opts = {
        position = "bottom",
        height = 0.4,
        border = "rounded",
        keys = {
          claude_hide = { toggle_key, function(self) self:hide() end, mode = "t", desc = "Hide" },
        },
      },
    },
    diff = {
      keep_focus = true,
    },
  },
  keys = {
    { toggle_key,   "<cmd>ClaudeCodeFocus<cr>",       desc = "Claude Code",       mode = { "n", "x" } },
    { "<leader>c",  nil,                              desc = "Claude Code" },
    -- { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                 desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil" },
    },
    -- Diff management
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
