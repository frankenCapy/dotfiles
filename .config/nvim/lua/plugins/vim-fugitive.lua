local wk = require("which-key")

return {
  'tpope/vim-fugitive',
  config = function()
    wk.add({
      { "<leader>g",  group = "Git" },
      { "<leader>gg", ":Gedit :<CR>",                                    desc = "fugitive" },
      { "<leader>gj", "<plug>(signify-next-hunk)",                       desc = "Signify Next Hunk" },
      { "<leader>gk", "<plug>(signify-prev-hunk)",                       desc = "Signify Prev Hunk" },
      { "<leader>gf", ":lua require'telescope.builtin'.git_files{}<CR>", desc = "Files" },
    })
  end
}
