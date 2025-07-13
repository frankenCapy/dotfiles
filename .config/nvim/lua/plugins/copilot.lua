return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 75,
        trigger_on_accept = true,
        keymap = {
          accept = "<M-y>",
          accept_word = false,
          accept_line = false,
          next = "<M-n>",
          prev = "<M-p>",
          dismiss = "<M-x>",
        },
      },
    })
  end,
}
