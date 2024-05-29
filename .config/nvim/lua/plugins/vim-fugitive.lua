local wk = require("which-key")

return {
  'tpope/vim-fugitive',
  config = function()
    wk.register({
      g = {
        name = "Git",
        g = { ":Gedit :<CR>", "fugitive" },
        j = { "<plug>(signify-next-hunk)", "Signify Next Hunk" },
        k = { "<plug>(signify-prev-hunk)", "Signify Prev Hunk" },
        f = { ":lua require'telescope.builtin'.git_files{}<CR>", "Files" },
      }
    }, { prefix = "<leader>" })
  end
}
