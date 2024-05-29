local tabnine = os.getenv("TABNINE")
if (tabnine ~= "true") then return {} end

return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh",
  config = function()
    -- require("tabnine").setup({
    --   disable_auto_comment = true,
    --   accept_keymap = "<M-c>",
    --   dismiss_keymap = "<M-x>",
    --   debounce_ms = 800,
    --   suggestion_color = { gui = "#808080", cterm = 244 },
    --   exclude_filetypes = { "TelescopePrompt" },
    --   log_file_path = nil, -- absolute path to Tabnine log file
    -- })
  end
}
